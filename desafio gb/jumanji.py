import random

def gameAction(action, dice, steps):
    steps = steps
    if action == 1:
        steps += dice
    elif action == 2:
        steps += dice
    elif action == 3:
        steps += dice
    elif action == 4:
        steps += dice
    elif action == 5:
        steps += dice
    elif action == 6:
        steps += dice
    elif action == 7:
        steps += dice
    elif action == 8:
        steps += dice

    return steps
def main():
    numbers = [1,2,3,4,5,6]
    gameActions = ["1O macaco Twelves apareceu e roubou os dados. Fique uma rodada sem jogar.",
    "2Um gorila te jogou longe. Volte uma casa.",
    "3Um aglomerado de morcegos bloqueou a visão de seu adversário, aproveite e avance mais duas casas.",
    "4Um forte vento virou o dado e alterou sua jogada. Ande o equivalente à sua jogada mais uma casa extra.",
    "5Um jacaré mordeu seu pé. Fique duas rodada sem jogar.",
    "6Uma manada de rinocerontes veio em sua direção. Você fugiu e voltou duas casas.",
    "7Estranhamente, nada aconteceu. Prossegue sua jogada.",
    "8Um enchente te deixou impossibilitado de se mover. Não jogue a próxima rodada"]
    steps = 0
    while True:
        print("Bem vindo ao Jumanji, por favor ENTER para jogar os dados")
        key = input()
        action = random.choice(gameActions)
        dice = random.choice(numbers)
        steps = gameAction(action[0], dice, steps)
        print(action[1:])

main()
