# Chapter3 - Book renting app
<p align="center">
  <img src="https://user-images.githubusercontent.com/74055102/141178562-ad9b8dd2-4000-4763-947d-bdd6e482c571.jpg" height=400/>
</p>

A book renting app!

## Setting up the project in your local environment
![image](https://user-images.githubusercontent.com/74055102/141175363-4c00515a-2658-475e-b510-394110d43ec5.png)
1. Make sure [Flutter]() is installed in your system.
2. Fork this repository.
3. Clone the **forked** repository -
```
git clone https://github.com/<your github username>/BookRentApp-Chapter3
```
4. Add a remote to the upstream repository.
```
# typing the below command should show you only 1 remote named origin with the URL of your forked repository
git remote -v
# adding a remote for the upstream repository
git remote add upstream https://github.com/Saransh-cpp/BookRentApp-Chapter3
```
6. Open the repository in [Android Studio]() or in [VS Code]().
7. Run the app.
8. Create a new issue if you face any difficulties (after browsing through StackOverflo on your own) and someone will help you:)

## Contributing to the project
![image](https://user-images.githubusercontent.com/74055102/141175911-fbefae23-d381-44b3-bcfb-d369cfb66659.png)

Now that you have the project set up in your local environment, follow the steps below to contribute!

1. Take up an already existing issue or create a new (but a valid) one.
2. Pull the latest code in.
```
# make sure you are on the main branch
git pull upstream main
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
8. Create a pull request from GitHub and wait for the reviews!

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
