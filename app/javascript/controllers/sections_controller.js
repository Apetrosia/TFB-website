import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["topic", "but"]
    static values = { sectionid:  Number}


    initialize() {
        alert("controller connected");
        this.butTarget.hidden = true;

    }

    clickOnSection({params: {sectid}}) {
        for (let i = 0; i < this.topicTargets.length; i++) {
            var elem = this.topicTargets[i];
            if (elem.sectionidValue == sectis) {
                if (elem.hidden)
                    elem.hidden = false;
                else
                    elem.hidden = true;
            }
        }
    }
}