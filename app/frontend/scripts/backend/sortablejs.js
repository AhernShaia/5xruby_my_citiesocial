import Sortable from "sortablejs";

document.addEventListener("turbolinks:load", () => {
  let el = document.querySelector(".sortable-items");

  if (el) {
    Sortable.create(el, {
      animation: 150,
      onEnd: function (evt) {
        let [model, id] = evt.item.dataset.item.split("_");
        console.log(model, id);
        let itemEl = evt.item; // dragged HTMLElement
        evt.to; // target list
        evt.from; // previous list
        evt.oldIndex; // element's old index within old parent
        evt.newIndex; // element's new index within new parent
        evt.oldDraggableIndex; // element's old index within old parent, only counting draggable elements
        evt.newDraggableIndex; // element's new index within new parent, only counting draggable elements
        evt.clone; // the clone element
        evt.pullMode; // when item is in another sortable: `"clone"` if cloning, `true` if moving
      },
    });
  }
});
