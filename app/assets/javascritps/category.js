$(document).on("turbolinks:load", function () {
  $(function () {
    function appendOption(category) {
      var html = `<option value="${category.id}" data-category="${category.id}">${category.category_name}</option>`;
      return html;
    }
    function appendChidrenBox(insertHTML) {
      var childSelectHtml = "";
      childSelectHtml = `<div class="Sell_warrap_index_main_center_content_box_body_contents" id="child_wrapper">
                        <div class="Sell_warrap_index_main_center_content_box_body_contents_filed">
                          <select class="Sell_warrap_index_main_center_content_box_body_contents_filed_category" id="child_category" name="category_id">
                            <option value="---" data-category="---">---</option>
                              ${insertHTML}
                          <select>
                        </div>
                      </div>`;
      $(
        ".Sell_warrap_index_main_center_content_box_body_photos__categroy"
      ).append(childSelectHtml);
    }
    function appendGrandchidrenBox(insertHTML) {
      var grandchildSelectHtml = "";
      grandchildSelectHtml = `<div class="Sell_warrap_index_main_center_content_box_body_contents" id="grandchild_wrapper">
                              <div class="Sell_warrap_index_main_center_content_box_body_contents_filed">
                                <select class="Sell_warrap_index_main_center_content_box_body_contents_filed_category" id="child_category" name="category_id">
                                  <option value="---" data-category="---">---</option>
                                    ${insertHTML}
                                <select>
                              </div>
                            </div>`;
      $(".Sell_warrap_index_main_center_content_box_body__js").append(
        grandchildSelectHtml
      );
    }
    $("#parent_category").on("change", function () {
      var parentCategory = document.getElementById("parent_category").value;
      if (parentCategory) {
        $.ajax({
          url: "/items/get_category_children",
          type: "GET",
          data: { parent_id: parentCategory },
          dataType: "json",
        })
          .done(function (children) {
            $("#child_wrapper").remove();
            $("#grandchild_wrapper").remove();
            var insertHTML = "";
            children.forEach(function (child) {
              insertHTML += appendOption(child);
            });
            appendChidrenBox(insertHTML);
          })
          .fail(function () {
            alert("カテゴリー取得に失敗しました");
          });
      } else {
        $("#child_wrapper").remove();
        $("#grandchild_wrapper").remove();
      }
    });
    $(".Sell_warrap_index_main_center_content_box_body_photos__categroy").on(
      "change",
      "#child_category",
      function () {
        var childId = $("#child_category option:selected").data("category");
        if (childId != "---") {
          $.ajax({
            url: "/items/get_category_grandchildren",
            type: "GET",
            data: { child_id: childId },
            dataType: "json",
          })
            .done(function (grandchildren) {
              if (grandchildren.length != 0) {
                $("#grandchild_wrapper").remove();
                var insertHTML = "";
                grandchildren.forEach(function (grandchild) {
                  insertHTML += appendOption(grandchild);
                });
                appendGrandchidrenBox(insertHTML);
              }
            })
            .fail(function () {
              alert("カテゴリー取得に失敗しました");
            });
        } else {
          $("#grandchild_wrapper").remove();
        }
      }
    );
  });
});
