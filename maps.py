import pygame
import sys

from collections import defaultdict as ddict
from typing import Self

class Game:
    
    WIDTH: int = 800
    HEIGHT: int = 800
    def __init__(self) -> Self:
        pygame.init()
        self.screen: pygame.Surface = pygame.display.set_mode((self.WIDTH, self.HEIGHT))
        self.rect: pygame.Rect = self.screen.get_rect()

        self.font = pygame.font.SysFont("comicsansms", 12)
        self.keyboard_inputs = set()
        self.framecount = 0
        self.framedata = []
        self.store_inputs = False
        
        self.mtime = 0
        self.print_height = 780

        self.clock: pygame.time.Clock = pygame.time.Clock()
        self.deltatime = self.clock.tick(60)

    def handle(self) -> None:
        
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                print(self.framedata)
                pygame.quit()
                sys.exit()
            elif event.type == pygame.KEYDOWN:
                if event.key == 32:
                    self.store_inputs = True
                    pygame.mixer.music.load(r"comprogIII\rhythm-game\music\Fire_Dance_(Game_Version_-_Vivid_BAD_SQUAD).ogg")
                    pygame.mixer.music.play(-1, self.mtime)
                if event.key == 13:
                    self.store_inputs = False
                    pygame.mixer.music.unload()
                elif self.store_inputs:
                    self.framedata.append([self.framecount, event.key])
                    
            
        


    def run(self) -> None:
        global deltatime
        self.handle()
        self.print_height = 780
        if self.framedata:
            self.screen.fill([0,0,0])
            for x in self.framedata[::-1]:
                
                self.screen.blit(self.font.render(f"{x}", False, [255,255,255]), (10, self.print_height))
                self.print_height -= 20
        pygame.display.flip()
        self.mtime += self.clock.get_time() / 1000
        self.framecount += 1
        self.deltatime = self.clock.tick(60)


if __name__ == "__main__":
    game: Game = Game()
    while True:
        game.run()

