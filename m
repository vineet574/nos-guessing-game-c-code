#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <windows.h>

#define WIDTH 20

void delay(int milliseconds) {
    Sleep(milliseconds);
}

void print_game(int player_pos, int obstacle_pos) {
    system("cls");
    for (int i = 0; i < WIDTH; i++) {
        if (i == player_pos)
            printf("P");
        else if (i == obstacle_pos)
            printf("O");
        else
            printf("-");
    }
    printf("\n");
}

int main() {
    int player_pos = WIDTH / 2;
    int obstacle_pos = 0;
    int score = 0;

    while (1) {
        if (_kbhit()) {
            char move = _getch();
            if (move == 'a' && player_pos > 0)
                player_pos--;
            else if (move == 'd' && player_pos < WIDTH - 1)
                player_pos++;
        }

        print_game(player_pos, obstacle_pos);
        
        if (player_pos == obstacle_pos) {
            printf("Game Over! Score: %d\n", score);
            break;
        }

        obstacle_pos++;
        if (obstacle_pos >= WIDTH) {
            obstacle_pos = 0;
            score++;
        }

        delay(100);
    }
    
    return 0;
}
