# Chapter3 - Book renting app 📚
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-3-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->
<p align="center">
  <img src="https://user-images.githubusercontent.com/75534476/141290305-8f94ec11-e2b6-4473-9d99-e4e7d00bf71b.jpg" height=400/>
</p>

A book renting app - open a new chapter in your journey 📔
- An e-commerce application specifically made for renting books.
- Chapter3 displays collections of top selling books as well as the option to have your taste curated and matched with a book.
- Customers can filter and select books based on genre, after which placing immediate or deferred orders with the option to cancel.
- If the customer isn't sure about a purchase they can add the book to a wish list or just leave it in the cart.
- There is also a backend Flutter application present which is used by administators to maintain the collection and available stock (which is private to customers obviously 😀)

This application was built in Flutter using Dart. Firebase paired with Firestore as a noSQL database are the backend of Chapter3. Functionality has been finalized, albeit with minor issues. Refactoring and UI work is also needed on this project besides the bug fixes.

## Description of the codebase
The code is well arranged into sub-directories which are -
- `Screens` (all the screens of the app, which are a lot)
- `QuizScreens` (the app has a quiz, which suggests you 1 or more books based on your response, this feature is relatively new and might have a lot of bugs)
- `Utility` (utility files (only 1) meant for google sign in)
- `model` (all the data models)
- `provider` (all the providers used for state management)
- `services` (all the utility functions/services corresponding to different data models)

## Setting up the project in your local environment💻
<p align="center">
    <img src="https://user-images.githubusercontent.com/74055102/141175363-4c00515a-2658-475e-b510-394110d43ec5.png" height=400/>
</p>

1. Make sure [Flutter](https://flutter.dev/?gclid=Cj0KCQiA-K2MBhC-ARIsAMtLKRsfTmxiQ9NuR3Jek8xNX896IE157icHbpgid_QF7agt4wAJRehRwvwaAjp2EALw_wcB&gclsrc=aw.ds) is installed in your system.
2. Fork this repository.
3. Clone the **forked** repository:
```
git clone https://github.com/<your github username>/BookRentApp-Chapter3
```
4. Add a remote to the upstream repository:
```
# typing the command below should show you only 1 remote named origin with the URL of your forked repository
git remote -v
# adding a remote for the upstream repository
git remote add upstream https://github.com/Saransh-cpp/BookRentApp-Chapter3
```
5. Open the repository in [Android Studio](https://developer.android.com/studio?gclid=Cj0KCQiA-K2MBhC-ARIsAMtLKRvb-ozHxKWf5qfWZwRcnaqgvTGO90T_J3u6Pm0s-_p81IyHxGKUhL0aAtJSEALw_wcB&gclsrc=aw.ds) or in [VS Code](https://code.visualstudio.com/).
6. Run the app.
7. Create a new issue if you face any difficulties (after browsing through StackOverflow on your own) and someone will help you 😁

## Contributing to the project 🛠

<p align="center">
    <img src="https://user-images.githubusercontent.com/74055102/141175911-fbefae23-d381-44b3-bcfb-d369cfb66659.png" height=400/>
</p>

Now that you have the project set up in your local environment, follow the steps below to contribute!

1. Take up an already existing issue or create a new (but a valid) one.
2. Pull the latest code in.
```
# make sure you are on the master branch
git pull upstream master
```
3. Create a new branch.
```
# replace xx with the issue number you are working on and give your branch a good name
git checkout -b issue-xx-a-good-name
```
4. Make your changes!
5. Once done with a particular feature, bug fix, or a documentation part, add your changes to the staging area.
```
git add .
```
6. Review and commit your changes.
```
# the message should be in present tense, for ex - "Added feature x" is not ideal but "Add feature X" is
git commit -m "a meaningful message"
```
7. Push your changes!
```
git push --set-upstream origin <your-branch-name>
```
8. Create a pull request from GitHub and wait for the review!

## Getting Started 

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/Saransh-cpp"><img src="https://avatars.githubusercontent.com/u/74055102?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Saransh</b></sub></a><br /><a href="https://github.com/Saransh-cpp/BookRentApp-Chapter3/commits?author=Saransh-cpp" title="Code">💻</a></td>
    <td align="center"><a href="http://youspeakcubic.github.io"><img src="https://avatars.githubusercontent.com/u/75534476?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Anthony De la Torre</b></sub></a><br /><a href="#content-Youspeakcubic" title="Content">🖋</a> <a href="https://github.com/Saransh-cpp/BookRentApp-Chapter3/commits?author=Youspeakcubic" title="Documentation">📖</a> <a href="#design-Youspeakcubic" title="Design">🎨</a></td>
    <td align="center"><a href="https://github.com/letsintegreat"><img src="https://avatars.githubusercontent.com/u/37345795?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Harshit Seksaria</b></sub></a><br /><a href="https://github.com/Saransh-cpp/BookRentApp-Chapter3/commits?author=letsintegreat" title="Code">💻</a> <a href="https://github.com/Saransh-cpp/BookRentApp-Chapter3/commits?author=letsintegreat" title="Documentation">📖</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!