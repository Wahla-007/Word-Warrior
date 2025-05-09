# Word Warrior

## Battle the Word Warlord

**Word Warrior** is a text-based word guessing game written in x86 Assembly. Take on the role of a brave warrior challenging a mysterious warlord in a battle of wits! The game combines classic hangman-style gameplay with a medieval combat theme.

## Game Description

In Word Warrior, you must defeat the evil Warlord by correctly guessing the secret word letter-by-letter. Each correct guess weakens the Warlord, while each incorrect guess diminishes your Warrior's health. Choose your difficulty, select a word category, and engage in epic battle!

Can you guess the Warlord's secret word before your health runs out?

## Features

- **Three Word Categories**: Test your guessing skills with words related to Weapons of War, War Animals, or Battlefield Locations
- **Multiple Difficulty Levels**: Choose from Easy (6 lives), Medium (4 lives), or Hard (2 lives)
- **Visual Health Tracking**: Monitor both your Warrior's health and the Warlord's health
- **ASCII Art**: Enjoy elaborate ASCII art for battle feedback and game outcomes
- **Sound Effects**: Immersive audio feedback enhances the gaming experience
- **Comprehensive UI**: User-friendly interface with color-coded messages and clear prompts

## Technical Implementation

Word Warrior is implemented in x86 Assembly language using:

- Irvine32 library for I/O operations
- Windows API for sound effects (Beep function)
- ASCII art for visual representation
- Structured programming with procedures and local variables
- Random word selection algorithm
- Game state tracking system

## Installation & Running

### Prerequisites

- MASM (Microsoft Macro Assembler)
- Irvine32 Library (must be installed at C:\irvine)
- Visual Studio (for assembly and linking)

### Running the Game

1. Clone this repository
2. Open the project in Visual Studio with Assembly support
3. Build the solution
4. Run the executable

Or if you have MASM set up with command line tools:

```bash
ml /c /Zi /coff word_warrior.asm
link /subsystem:console word_warrior.obj irvine32.lib kernel32.lib
word_warrior.exe
```

## How to Play

1. **Start the Game**: Run the executable to launch Word Warrior
2. **Select a Category**: Choose from Weapons of War (1), War Animals (2), or Battlefield Locations (3)
3. **Choose Difficulty**: Select Easy (1), Medium (2), or Hard (3) based on how many lives you want
4. **Battle the Warlord**: Guess letters one at a time
   - Correct guesses damage the Warlord
   - Incorrect guesses damage you
5. **Win or Lose**: Guess the complete word to defeat the Warlord, or lose all your health and face defeat

## Game Strategy

- Start with common vowels (A, E, I, O, U)
- Look for patterns in the revealed letters
- Consider the word category when making guesses
- Prioritize common consonants (T, N, S, R) after vowels

## Word Categories

1. **Weapons of War**: SWORD, BOMBS, ARROW, LANCE, SPEAR
2. **War Animals**: HORSE, TIGER, EAGLE, SNAKE, BEARS, and more
3. **Battlefield Locations**: RIVER, HILLS, FIELD, TOWER, FORTS, and more

## Contributing

Contributions to Word Warrior are welcome! Here are some ways you can help:

- Add new word categories
- Improve the ASCII art
- Enhance sound effects
- Optimize the assembly code
- Fix bugs or suggest improvements

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Irvine32 library for Assembly programming
- Contributors and testers who helped refine the game

---

*Prepare for battle, Warrior... Guess the word to defeat the Warlord!*
