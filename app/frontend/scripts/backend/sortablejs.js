import Sortable from "sortablejs";
import Rails, { ajax } from "@rails/ujs";

document.addEventListener("turbolinks:load", () => {
  let el = document.querySelector(".sortable-items");

  if (el) {
    Sortable.create(el, {
      animation: 150,
      onEnd: function (evt) {
        let [model, id] = evt.item.dataset.item.split("_");
        console.log(model, id);

        let data = new FormData();
        data.append("id", id);
        data.append("from", evt.oldIndex);
        data.append("to", evt.newIndex);

        Rails.ajax({
          url: "/admin/categories/sort",
          type: "PUT",
          data,
          success: (resp) => {
            console.log(resp);
          },
          error: (error) => {
            console.log(error);
          },
        });
      },
    });
  }
});
