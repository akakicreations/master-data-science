from argparse import ArgumentParser

def funcion(a, b):
    print(f'Me han introducido estos números {a} y {b}')

def parse_args():
    parser = ArgumentParser()
    parser.add_argument("-n1",
                        "--numero_1",  
                        required=True,
                        type=int,
                        help="primer numero")
    parser.add_argument("-n2",
                        "--numero_2",
                        required=True,
                        type=int,
                        help="segundo numero")
    args = parser.parse_args()
    return args.numero_1, args.numero_2
    
if __name__ == '__main__':
    a, b = parse_args()
    funcion(a, b)
