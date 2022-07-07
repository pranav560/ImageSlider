# ImageSlider

UI component image slider in OpenHarmony.

## Download & Install

Install using npm

```npm i @ohos/imageslider```

![imageslider](https://user-images.githubusercontent.com/84433855/177676137-a2f8a81d-b49c-47b3-9a57-0078b7f7a9f7.png)

Access image slider attributes through a object of ImageSliderModel and customize the image slider(if needed) using setter functions as
shown and finally pass the object along with the array of image resources to ImageSlider .

## Usage Instructions

To be able to use image slider, below import statement must be used

```ets
//import statement
import { ImageSlider ,ImageSliderModel
}  from "@ohos/imageslider"
```
## how to use image slider
```ets
//Creating object
  private ImageSliderModel1: ImageSliderModel = new ImageSliderModel();
//array of image resources
  private img: ResourceStr[] = [$r("app.media.img1"),$r("app.media.img2"),$r("app.media.img3"),$r("app.media.img4"),$r("app.media.img5")]
```
```ets
//Customization
aboutToAppear(){
      this.ImageSliderModel1.setBlockColor("#ffffff")
      this.ImageSliderModel1.setTrackColor("#000000")
      this.ImageSliderModel1.setSelectedColor("#587687")
      this.ImageSliderModel1.setShowSteps(false)
      this.ImageSliderModel1.setNumberOfItems(this.img.length)
  }
```
```ets
//Passing Customized/Non-customized object to ImageSlider along with the array of image resources
ImageSlider(
        {
          obj : this.ImageSliderModel1,
          img : this.img
        }
      )
```

## Compatibility
Supports OpenHarmony API version 9

# Reference:

Design by : Pranav Singh
