import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["template", "link"];

  add_sku(e) {
    e.preventDefault();
    let content = this.templateTarget.innerHTML.replace(
      "/NEW_RECORD/g",
      new Date().getTime()
    );
    this.linkTarget.insertAdjacentHTML("beforebegin", content);
    // console.log(content);
  }
  connect() {
    console.log("hi");
  }
}
