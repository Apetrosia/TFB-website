import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
    static targets = [ "tg"]


    initialize() {
        alert("aaaaa");
        this.tgTarget.hidden = true;

    }

    clickButton() {
        this.tgTarget.hidden = false;
    }

}