$(function(){
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }

  // 子カテゴリー用のhtmlの作成。子カテゴリーのidはいらないので name=""としています。
  function appendChild(insertHTML) {
    var childSelectHTML = '';
    childSelectHTML = ` <div class="listing-select-wrapper__child">
                          <select class="listing-select-wrapper__child--select" id="child_category" name="">
                            <option value="---" data-category="---">選択してください</option>
                            ${insertHTML}
                          </select>
                        </div>`;
    $('.listing-select-wrapper').append(childSelectHTML);
  }

  // 孫カテゴリー用のhtmlを作成。孫カテゴリーのidが欲しいのでname="product[category_id]"としています。
  function appendGrandChild(insertHTML) {
    var grandChildSelect = '';
    grandChildSelect = `<div class="listing-select-wrapper__grandchild">
                          <select class="listing-select-wrapper__grandchild--select" id="grandchild_category" name="product[category_id]">
                            <option value="---" data-category="---">選択してください</option>
                            ${insertHTML}
                          </select>
                        </div>`;
    $('.listing-select-wrapper').append(grandChildSelect);
  }

// 親カテゴリーの値が変わった時の処理を書きます
  $('#parent_category').on('change', function() {
    // 親カテゴリーのデータを取得して変数にいれる
    var parentCategory = document.getElementById('parent_category').value;
    if (parentCategory != '選択してください'){
      // ajaxの処理。urlを/products/get_category_childrenにしないとrenderでeditに戻された時に上手く働かない
      $.ajax({
        url: '/products/get_category_children',
        type: 'GET',
        data: { category_id: parentCategory },
        dataType: 'json'
      })
      // 成功した時の処理
      .done(function(children){
        // 元々あった子カテゴリーと孫カテゴリーを消す。
        $('.listing-select-wrapper__child').remove();
        $('.listing-select-wrapper__grandchild').remove();
        // insertHTMLを定義して中身にオプションをつける。
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        // オプション付きのinsertHTMLをappendChildにいれる。
        // 上のappendChildで定義された$('.listing-select-wrapper--edit').append(childSelectHTML);により一番、つまり親カテゴリーのしたに差し込まれる。
        appendChild(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else {
      $('#child_category').remove();
      $('#grandchild_category').remove();
    }
  });

  // 子カテゴリーとやっていることは基本的に同じです 
  $('.listing-select-wrapper').on('change', '#child_category', function(){
    var childId = document.getElementById('child_category').value;
    if (childId !== "---") {
      $.ajax({
        url: '/products/get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren) {
        if (grandchildren.length != 0) {
          $('#grandchild_category').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandChild(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else {
      $('#grandchild_category').remove();
    }
  })
})