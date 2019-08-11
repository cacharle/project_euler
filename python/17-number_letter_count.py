w_nums = {
    '0': '',
    '00': '',
    '1': 'one',
    '2': 'two',
    '3': 'three',
    '4': 'four',
    '5': 'five',
    '6': 'six',
    '7': 'seven',
    '8': 'eight',
    '9': 'nine',
    '10': 'ten',
    '11': 'eleven',
    '12': 'twelve',
    '13': 'thirteen',
    '14': 'fourteen',
    '15': 'fifteen',
    '16': 'sixteen',
    '17': 'seventeen',
    '18': 'eighteen',
    '19': 'nineteen',
    '20': 'twenty',
    '30': 'thirty',
    '40': 'forty',
    '50': 'fifty',
    '60': 'sixty',
    '70': 'seventy',
    '80': 'eighty',
    '90': 'ninety',
    '100': 'hundred',
    '1000': 'thousand'
}
w_nums = {key: len(val) for (key, val) in w_nums.items()}

def two_digit_num(num):
    if num[0] == '1':
        return w_nums[num]
    else:
        return w_nums[num[0] + '0'] + w_nums[num[1]]


c = 0
for num in [str(n) for n in range(1, 1001)]:
    c += [
        lambda: w_nums[num],
        lambda: two_digit_num(num),
        lambda: (
            w_nums[num[0]] + w_nums['100']
            + (len('and') if num[1:] != '00' else 0)
            + two_digit_num(num[1:])
        ),
        lambda: len('onethousand')
    ][len(num)-1]()
    
print(c)
