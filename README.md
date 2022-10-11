Peraire Ground Truth
=====================

![characters badge](badges/characters.svg) ![regions badge](badges/regions.svg) ![lines badge](badges/lines.svg) ![files badge](badges/files.svg) 

## License

This dataset and model are published under the CC-BY 4.0 License.

## Description

This dataset was created in order to produce an HTR model for the Digital Peraire project. The documents are handwritten, dating from the second half of the 20th century, written in French with a blue ink pen or, more frequently, with a blue pencil. Occasional marginal notes appear in red. 

## Transcription guidelines

The transcription respects what is written on the document, including ponctuation and spelling errors. 

![image](https://user-images.githubusercontent.com/33317799/195112502-5a667927-654f-4bef-9877-792915351ab3.png)

The case is respected: capital letters are transcribed with capital letters.

![image](https://user-images.githubusercontent.com/33317799/195112677-32b18440-f669-4802-83e1-ab61f19902ea.png)

Crossed out words are signaled by `#` which isn't used to transcribe anything else.

![image](https://user-images.githubusercontent.com/33317799/195113809-5c5bcc36-2da4-4114-b46a-5ddc0d01480e.png)

## Segmentation guidelines

The SegmOnto ontology was used for the segmentation of this dataset. 

For regions, `MainZone` and `MarginTextZone` were used. For lines, `DefaultLine` and `InterlinearLine` were used. 

| Regions | Lines |
| :-----: | :---: |
| ![image](https://user-images.githubusercontent.com/33317799/195114722-222dfd08-7fba-4943-a86d-dc73aeab26bf.png) | ![image](https://user-images.githubusercontent.com/33317799/195115222-b71aa830-abcf-42c7-9259-03468a821b31.png) |

**Warning:** Since the main goal of this dataset was to produce ground truth for the transcription phase, and given how faded the text is on some pages, it is not recomended to use the following images to train a segmentation model:

- B.1.intro-eurasie_0005.jpg
- B.1b.europe-centrale_0005.jpg
- B.2.europe-orientale_0007.jpg 
- B.26.malais_0048.jpg
- B.28.java2_0017.jpg

## Sources

The original documents are held at the Bibliothèque Sébert, Espéranto-France, Paris. They should be mentionned every time the images are used. 

## Model

See the [models' README](https://github.com/alix-tz/peraire-ground-truth/blob/master/models/readme.md) for more information about the training of the model. 

