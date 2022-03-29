# Over-sampling methods for classification problems

### Some methods studied are:
1. Naive random over-sampling
2. SMOTE
3. ADASYN
4.
5.

## Naive random over-sampling

### This method basically consists of performing a sampling with replacement in relation to the minority class. Some disadvantages are that the resampled data does not contain new information and can generate some kind of overfitting for the models used later.

### The following image shows a improvement using this method in a decision function of the logistic regression classifier example:

![random_over_sampler](https://github.com/AlbertoRodrigues/classification_imbalaced_data/blob/main/oversampling_methods/images/random_over_sampler.png)

## Naive random over-sampling smoothed

### Almost identical approach to the previous method, what changes is that the generated observations are not exactly the same as the minority class, a small variance is added to make it different.

The following image shows the observations generated around the minority classes:

![random_over_sampler_smoothed](https://github.com/AlbertoRodrigues/classification_imbalaced_data/blob/main/oversampling_methods/images/random_over_sampler_smoothed.png)

## SMOTE(Synthetic Minority Oversampling Technique)

### The SMOTE method consists of generating new observations of the minority class through interpolation of the k nearest neighbors. One of the k nearest neighbors is chosen at random and is used in the interpolation for some observations and in this way a new synthetic observation is generated.

### More specifically:

![generating_observations_smote](https://github.com/AlbertoRodrigues/classification_imbalaced_data/blob/main/oversampling_methods/images/smote_generating_observations.png)

### Its decision function may be:

![smote](https://github.com/AlbertoRodrigues/classification_imbalaced_data/blob/main/oversampling_methods/images/smote.png)

