# Snaky
Игра "Змейка" для микроконтроллера ATmega128. Для игры используется светодиодная матрица 8x8 и 4 кнопки.
Для запуска игры необходимы:
1. Программа-симулятор микроконтроллерных устройств PROTEUS (ISIS 7 Professional);
2. Файл из репозитория Snaky.DSN - принципиальная схема игры для PROTEUS;
3. Файл из репозитория Snaky.asm - исходный код игры, написанный на ассемблере для микроконтроллера ATmega128.

Для запуска игры откройте файл Snaky.DSN в программе PROTEUS. На появившейся схеме выделите микроконтроллер кликнув по нему левой кнопкой мыши -> правой кнопкой мыши по микроконтроллеру -> в выпадающем меню выберите пункт "Add/Remove Source Files". Появится новое окно, в нём нажмите кнопку "New" и, используя проводник, выберите ранее скачанный файл "Snaky.asm", затем нажмите "ОК". Можно запускать симуляцию (игру), нажав кнопку "Play" в левом нижем углу окна программы. Светодиодная матрица загорится с цифрой, обозначающей уровень сложности игры (скорость движения змейки). Справа от микроконтроллера имеется 4 кнопки: верхняя, левая, правая и нижняя. Это кнопки управления. Левой и правой кнопками можно выбрать сложность игры от 0 до 9. Нижняя кнопка запустит игру. Управление змейкой осуществляеется всё теми же кнопками.
