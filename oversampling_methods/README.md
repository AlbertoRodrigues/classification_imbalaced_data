# Over-sampling methods for classification problems

### Some methods studied are:
1. Naive random over-sampling
2. SMOTE
3. ADASYN
4.
5.

## Naive random over-sampling

 This method basically consists of performing a sampling with replacement in relation to the minority class. Some disadvantages are that the resampled data does not contain new information and can generate some kind of overfitting for the models used later.

 The following image shows a improvement using this method in a decision function of the logistic regression classifier example:

![random_over_sampler](https://github.com/AlbertoRodrigues/classification_imbalaced_data/blob/main/oversampling_methods/images/random_over_sampler.png)

## Naive random over-sampling smoothed

 Almost identical approach to the previous method, what changes is that the generated observations are not exactly the same as the minority class, a small variance is added to make it different.

The following image shows the observations generated around the minority classes:

![random_over_sampler_smoothed](https://github.com/AlbertoRodrigues/classification_imbalaced_data/blob/main/oversampling_methods/images/random_over_sampler_smoothed.png)

## SMOTE(Synthetic Minority Oversampling Technique)

 The SMOTE method consists of generating new observations of the minority class through interpolation of the k nearest neighbors. One of the k nearest neighbors is chosen at random and is used in the interpolation for some observations and in this way a new synthetic observation is generated.

 More specifically:

![generating_observations_smote](https://github.com/AlbertoRodrigues/classification_imbalaced_data/blob/main/oversampling_methods/images/smote_generating_observations.png)

 Its decision function may be:

![smote](https://github.com/AlbertoRodrigues/classification_imbalaced_data/blob/main/oversampling_methods/images/smote.png)

## ADASYN(Adaptive Synthetic Sampling Method)

Almost identical to the SMOTE algorithm, it uses the same method to generate the synthetic observations, but now it generates synthetic observations from the minority class observations where knn misclassifies (SMOTE does not take this into account).

![adasyn](https://github.com/AlbertoRodrigues/classification_imbalaced_data/blob/main/oversampling_methods/images/adasyn.png)

### Observation: The methods presented assume that the data are continuous, with the exception of the standard random over sampling. But there are some methods that make use of categorical features.

## Smote Variants for categorical data

### SMOTENC

Variant of SMOTE that assumes that there are necessarily continuous and categorical features, we cannot use if there are only categorical variables. When the variable is categorical, the value of this variable in the generated observation is simply the most frequent value of the minority class observations.

### SMOTENC

Variant of SMOTE that assumes that there are only categorical features. Also, the value of this variable in the generated observation is simply the most frequent value of the minority class observations.

## Borline SMOTE

There are two types of borderline(1 and 2), they will assign the minority class observation a category, which can be:

1. Noise, when all nearest neighbors belong to a different class.
2. Danger, when at least half of the nearest neighbors (or some specified number) are of the same class as that observation.
3. Safe, when all nearest neighbors belong to the same class of that observation.

The borderline smote uses only danger observations to generate new observations, but with one big difference. Borderline smote 1 uses only the nearest neighbor that is of the same class as the minority class observation while borderline smote 2 uses any neighbor, regardless of class.

## KMeans SMOTE

A KMeans is performed before generating the observations, the cluster that has the highest proportion of observations from the minority class and uses them to generate the observations.

