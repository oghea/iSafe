# isafe

Revamped isafe for mobile platform.

## Developer Guidance

### Coding style

This project use Flutter static code analysis following pedantic rules provided by Google  
(details here https://medium.com/dartlang/pedantic-dart-1c7d365510de)  

### Commit Rules

New branch should begin from latest commit of branch **develop**  
Each branch except **master** and **develop** should begin with prefix:  
- `feature/`
- `hotfix/`
- `release/`
- `support/`

For every commit, its message should follow [Angular Guideline](https://github.com/angular/angular/blob/master/CONTRIBUTING.md#-commit-message-guidelines)  
For example:
- `feat(inspection): add new pages`
- `fix(observation): catch error exception`
- `docs: update documentation for README.md`
