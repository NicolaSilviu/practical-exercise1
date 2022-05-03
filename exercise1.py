for number in range(100, 0, -1):
    if number % 5 == 0 and number % 3 == 0:
        print("Agile")
    elif number % 3 == 0:
        print("Software")
    elif number % 5 == 0:
        print("Testing")
    else:
        print(number)
        