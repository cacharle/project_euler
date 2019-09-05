import requests
import json
from bs4 import BeautifulSoup
from argparse import ArgumentParser


CONFIG_FILENAME = 'config.json'

def parse_args(languages):
    parser = ArgumentParser(description='Problem file generator')
    parser.add_argument('indexes', nargs='+', type=int,
                        help='problems indexes for which files are generated')
    parser.add_argument('-l', '--language', choices=languages, required=True,
                        help='the file programming language')
    return vars(parser.parse_args())

def read_config():
    try:
        with open(CONFIG_FILENAME, 'r') as file:
            config = json.load(file)
    except FileNotFoundError:
        print(f'Error: file {CONFIG_FILENAME} not found')
        exit(1)
    return config


def write_problem(index, title, sub_title, content, language_config, config):
    text = '\n'.join([language_config['comment']['top'], title, sub_title, '', content,
                      language_config['comment']['bottom']])
                      # *[content[i * config['line_wrap']:(i + 1) * config['line_wrap']]
                      #   for i in range(int(len(content) / config['line_wrap']))],
    text = ('\n'.join([language_config['comment']['prefix']
                      + line for line in text.split('\n')])
                      + '\n' * config['problem_padding'])
    slug = ''.join([c for c in title.lower().replace(' ', '_') if c.isalpha() or
                    c.isdigit() or c == '_'])
    filename = (str(index).zfill(3) + '-'
                + slug + '.' + language_config['extension'])
    try:
        with open(filename, 'w') as file:
            file.write(text)
        print(f'{filename} created')
    except:
        print(f'Error: could not create file {filename}')


def fetch_problem(index, config, args):
    url = config['url_format'].format(index=index)

    print(f"fetching problem {index} at {url}...")
    data = requests.get(url)
    soup = BeautifulSoup(data.text, 'html.parser')

    print('parsing data...')
    data = soup.find('div', {'id': 'content'})
    problem_title = data.h2.text.strip(' \n\t')
    problem_sub_title = data.h3.text.strip(' \n\t')
    problem_text = soup.find('div', {'class': 'problem_content'}).text.strip(' \n\t')

    print('\nTitle:', problem_title)
    print('Sub title:', problem_sub_title)
    print('Text:', problem_text, '\n')

    write_problem(index, problem_title, problem_sub_title, problem_text,
                  config['languages'][args['language']], config)


if __name__ == '__main__':
    config = read_config()
    args = parse_args(config['languages'].keys())
    for p in args['indexes']:
        fetch_problem(p, config, args)
