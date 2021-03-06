# The Recipe App

[![Build status](https://build.mobile.azure.com/v0.1/apps/a046a70f-dd1f-459d-9d1f-6d45057911b8/branches/master/badge)](https://mobile.azure.com)

## Summary

The Recipe App is a new fun way to discover, share and make recipies. It doesn't matter if you are a cook enthusiast or you just want to learn how to cook, The Recipe App will help you in your journey. 

## Features

#### Sign Up / Sign In / Onboarding

- [x] As a user I want to be able to log into the app
- [x] As a user I want to be able to sign up for an account using my email address
- [x] As a user I want to be able to log in using Facebook Auth service
- [x] As a user I want to be able to add friends from different sources
- [x] As a user I want to know what this app is about in one screen

#### View and Associate Recipies

- [x] As a user that just logged in I should land on the Home Page that includes a curated list of recipies organized by different subjects (what your friends like, your food preferences, most liked recipies)
	- [x] As a user I would like to quickly find something that I am looking for to cook
	- [ ] If available, as a user it would be cool to see an ARkit model representing the final dish
- [x] As a user I want to be able to associate recipies to myself
- [x] As a user I want to be able to see the recipe details (photos, time to cook, level of difficulty, ingredients, steps to cook it, how many people have added it to their profiles)
- [x] As a user I want to be able to see other people profile with their most popular recipies (from themselves or that they have added) and the rest of their recipies
- [ ] Every user of the app has a number of recipies, a number that represents the how many times other people have associated their recipies and a score of popularity
- [x] As a user I want to be able to share recipies to other people that may or may not be into the app

#### Create Recipies

- [x] As a user I want to be able to create a recipe
	- [x] Add photos/audios (select main image)
	- [x] Add ingredients
	- [x] Add steps to cook, time to cook and ingredientes
	- [x] Based on number of the data input general a level of difficulty 

#### Profile pages

- [x] As a user I want to be able to visit my profile, see my info and the recipies associated with my user
- [x] As a user I want to be able to edit my profile (profile picture via camera or photo library), first name, last name
- [ ] As a user I want to be able to create an association with another user

#### Notifications

- [ ] As a user I want to receive notifications when:
	- [ ] A user has followed me
	- [ ] A user has associated my recipe (or a recipe that I have associated)
	- [ ] A reminder of what's new to cook once in a while?

## Optionals

- [ ] As a user I want to be able to log in using Google Auth service
- [ ] As a user I want to be able to log in using Twitter Auth service
- [ ] As a user I want to scan a barcode of a product to add it as an ingredient
- [ ] As a user I want to keep an inventory of ingredients that I want to use for my recipies
- [ ] As a user I would like to get recommendations of similar recipies
- [ ] As a user I want to receive notification when a friend posts a new recipe
- [ ] As a user I would like to have an option to shop ingredientes (either online or show a store near by) 
- [ ] As a user I would like to receive a notification when there is a popular dish in my area 
- [ ] When entering steps to cook as a user I would like to upload a video of the process
- [ ] Use SiriKit to search for recipies
- [ ] Use iOS Spotlight to seach for recipies

## Team

- [Vijayanand Sankarasubramanian](https://github.com/vijayanands)
- [Alex Doan](https://github.com/lexicalparadox)
- [Cesar Cavazos](https://github.com/ccavazos)

## License

    Copyright 2017 The Recipe App Team

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
