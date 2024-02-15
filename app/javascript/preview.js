document.addEventListener('turbo:load', function(){
  // 新規出品・編集ページのフォームを取得
  const imageFields = document.querySelectorAll('input[type="file"][name="item[images][]"]');

  // プレビューを表示するためのスペースを取得
  const previewList = document.getElementById('previews');

  // 新規出品・編集ページのフォームがないならここで終了。「!」は論理否定演算子。
  if (!imageFields.length) return null;

  // ファイル選択ボタンごとに処理を行う
  imageFields.forEach(function(fileField) {
    // input要素で値の変化が起きた際に呼び出される関数
    fileField.addEventListener('change', function(e){
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      // 画像を表示するためのdiv要素を生成
      const previewWrapper = document.createElement('div');
      previewWrapper.setAttribute('class', 'preview');

      // 表示する画像を生成
      const previewImage = document.createElement('img');
      previewImage.setAttribute('class', 'preview-image');
      previewImage.setAttribute('src', blob);

      // 生成したHTMLの要素をブラウザに表示させる
      previewWrapper.appendChild(previewImage);
      previewList.appendChild(previewWrapper);

      // 2枚目以降のファイル選択ボタンを作成
      const newFileField = document.createElement('input');
      newFileField.setAttribute('type', 'file');
      newFileField.setAttribute('name', 'item[images][]');
      newFileField.setAttribute('class', 'file-field');

      // 新しいファイル選択ボタンにもchangeイベントをセット
      newFileField.addEventListener('change', changedFileField);

      // 生成したfile_fieldを表示
      previewList.appendChild(newFileField);
    });
  });

  // ファイル選択ボタンが変更された際の処理
  function changedFileField(e) {
    const file = e.target.files[0];

    // data-indexを取得
    const dataIndex = e.target.getAttribute('data-index');

    // data-indexを使用して、既にプレビューが表示されているかを確認する
    const alreadyPreview = document.querySelector(`.preview[data-index="${dataIndex}"]`);

    // 画像が選択されなかった場合はプレビューを削除
    if (!file) {
      if (alreadyPreview) {
        alreadyPreview.remove();
      }
      return null;
    }

    const blob = window.URL.createObjectURL(file);

    if (alreadyPreview) {
      // クリックしたfile_fieldのdata-indexと、同じ番号のプレビュー画像が既に表示されている場合は、画像の差し替えのみを行う
      const alreadyPreviewImage = alreadyPreview.querySelector("img");
      alreadyPreviewImage.setAttribute("src", blob);
      return null;
    }

    // 画像を表示するためのdiv要素を生成
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');
    previewWrapper.setAttribute('data-index', dataIndex);

    // 表示する画像を生成
    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);

    // 生成したHTMLの要素をブラウザに表示させる
    previewWrapper.appendChild(previewImage);
    previewList.appendChild(previewWrapper);
  }
});
