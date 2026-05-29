# Prompting Tips


## Escape Sequences

Basic Format: `\[\033[<a>;<?b>;<?c>;<?d>m\]`

$color: (standard, bright)

- (0,8) black
- (1,9) red
- (2,10) green
- (3,11) yellow
- (4,12) blue
- (5,13) magenta
- (6,14) cyan
- (7,15) white

## Escape Codes

- FG Color => 38;5;$color (39 default)
- BG Color => 48;5;$color (49 default)
- Bold => 1
- Unbold => 22
- Unset all => 0

## Prompt Special Characters

- \w => working directory
- \u => current user
- \H, \h => hostname (long, short)
