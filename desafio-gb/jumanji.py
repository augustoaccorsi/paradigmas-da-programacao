import random

def printInfo(round, steps):
        print("Rodada: " + repr(round) + "/15")
        print("Posição do tabuleiro: " + repr(steps) + "/30")

def main():
    numbers = [1,2,3,4,5,6]
    gameActions = ["1O macaco Twelves apareceu e roubou os dados. Fique uma rodada sem jogar.",
    "2Um gorila te jogou longe. Volte uma casa.",
    "3Um aglomerado de morcegos bloqueou a visão de seu adversário, aproveite e avance mais duas casas.",
    "4Um forte vento virou o dado e alterou sua jogada. Ande o equivalente à sua jogada mais uma casa extra.",
    "5Um jacaré mordeu seu pé. Fique duas rodada sem jogar.",
    "6Uma manada de rinocerontes veio em sua direção. Você fugiu e voltou duas casas.",
    "7Estranhamente, nada aconteceu. Prossegue sua jogada.",
    "8Uma enchente te deixou impossibilitado de se mover. Não jogue a próxima rodada"]
    steps = 1
    round = 1

    print(" \n- Bem vindo ao Jumanji, O desafio começou e não poderá ser parado até seu final")
    print(" \n- Você terá 15 jogadas para a conclusão. o desafio iniciará assim que você jogar os dados")

    while True:
        print("--------------------------------------------------")
        if round > 15 or steps >= 30:
            break
        printInfo(round, steps)
        print("\n- Por favor pressione ENTER para jogar os dados")
        key = input()
        action = random.choice(gameActions)
        dice = random.choice(numbers)
        print("\nDado: " + repr(dice))

        if action[0] == "1":
            steps += dice
            round += 1;
            if round > 15 or steps >= 30:
                break
            print(action[1:])
        elif action[0] == "2":
            steps += dice -1
            if round > 15 or steps >= 30:
                break
            print(action[1:])
        elif action[0] == "3":
            steps += dice +2
            if round > 15 or steps >= 30:
                break
            print(action[1:])
        elif action[0] == "4":
            steps += dice +1
            if round > 15 or steps >= 30:
                break
            print(action[1:])
        elif action[0] == "5":
            steps += dice
            round += 2
            if round > 15 or steps >= 30:
                break
            print(action[1:])
        elif action[0] == "6":
            steps += dice - 2
            if round > 15 or steps >= 30:
                break
            print(action[1:])
        elif action[0] == "7":
            steps += dice
            if round > 15 or steps >= 30:
                break
            print(action[1:])
        elif action[0] == "8":
            steps += dice
            round += 1
            if round > 15 or steps >= 30:
                break
            print(action[1:])

        round += 1;

    if steps >= 30:
        print("Parabéns por essa conquista, você conseguiu vencer Jumanji, te aguardo em Zatura!")
    elif round > 15:
        print("Infelizmente você entrou para a estatísca: mais uma pessoa que não vence Jumanji, mais sorte em uma próxima vida!")


main()
