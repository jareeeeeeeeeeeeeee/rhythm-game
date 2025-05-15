import pygame
import sys
import csv

from collections import defaultdict as ddict
from typing import Self

file = "./maps/fire_dance.csv"
song = "./music/firedance.ogg"

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
        self.countdown = 5
        self.counting_down = False
        self.start = None
        self.n = 0
        self.mtime = 0
        self.print_height = 780

        self.clock: pygame.time.Clock = pygame.time.Clock()
        self.deltatime = self.clock.tick(60)

    def handle(self) -> None:
        
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                print(self.framedata)
                with open(f"{file}", "w") as csvfile:
                    writer = csv.DictWriter(csvfile, fieldnames=["frame", "lane"])
                    for x in self.framedata:
                        writer.writerow({"frame": x[0], "lane": x[1]})
                pygame.quit()
                sys.exit()
            elif event.type == pygame.KEYDOWN:
                print(event.key)
                if event.key == 32:
                    self.counting_down = True
                    self.start = self.mtime
                    self.n = 0
                if event.key == 13:
                    self.store_inputs = False
                    pygame.mixer.music.unload()
                elif self.store_inputs:
                    if event.key == 100:
                        self.framedata.append([self.framecount, "0"])
                    if event.key == 102:
                        self.framedata.append([self.framecount, "1"])
                    if event.key == 106:
                        self.framedata.append([self.framecount, "2"])
                    if event.key == 107:
                        self.framedata.append([self.framecount, "3"])


    def run(self) -> None:
        global deltatime
        self.handle()
        if self.counting_down == True:
            if self.n > 5:
                self.counting_down = False
                self.framecount = 0
                self.mtime = 0
                self.store_inputs = True
                pygame.mixer.music.load(f"{song}")
                pygame.mixer.music.play(-1, self.mtime)
            if self.mtime > self.start + self.n:
                print(5 - self.n)
                self.n += 1
            

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

