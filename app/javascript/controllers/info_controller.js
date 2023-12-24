import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
    static targets = [ "tg"]


    initialize() {
        this.tgTarget.hidden = true;
    }

    clickButton() {
        this.tgTarget.hidden = false;
    }

}