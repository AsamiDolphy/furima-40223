document.addEventListener('turbo:load', function(){
  // 新規出品・編集ページのフォームを取得
  const imageField = document.getElementById('item-image');

  // プレビューを表示するためのスペースを取得
  const previewList = document.getElementById('previews');

  // 新規出品・編集ページのフォームがないならここで終了。「!」は論理否定演算子。
  if (!imageField) return null;

  // input要素を取得
  const fileField = document.querySelector('input[type="file"][id="item-image"]');
  // input要素で値の変化が起きた際に呼び出される関数
  fileField.addEventListener('change', function(e){
    // 古いプレビューが存在する場合は削除
    const alreadyPreview = document.querySelector('.preview');
    if (alreadyPreview) {
      alreadyPreview.remove();
    };

    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    // 画像を表示するためのdiv要素を生成
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');

    // 表示する画像を生成
    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');

    // Create a new image object
    const imageObject = new Image();

    // Set the source of the image object to the blob URL
    imageObject.src = blob;

    // Once the image object is loaded, resize it and set it as the src of the previewImage
    imageObject.onload = function() {
      const canvas = document.createElement('canvas');
      const context = canvas.getContext('2d');

      // Set the dimensions of the canvas to the desired resized dimensions
      const newWidth = 200; // Set the new width here
      const aspectRatio = imageObject.height / imageObject.width;
      const newHeight = newWidth * aspectRatio;

      canvas.width = newWidth;
      canvas.height = newHeight;

      // Draw the resized image on the canvas
      context.drawImage(imageObject, 0, 0, newWidth, newHeight);

      // Convert the canvas image to a data URL
      const resizedImage = canvas.toDataURL('image/jpeg');

      // Set the src attribute of the previewImage to the resized image data URL
      previewImage.src = resizedImage;

      // Append the previewImage to the previewWrapper
      previewWrapper.appendChild(previewImage);

      // Append the previewWrapper to the previewList
      previewList.appendChild(previewWrapper);
    };
  });
});
