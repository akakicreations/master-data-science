def midir(x):
    return [i for i in dir(x) if not i.startswith('__')]
