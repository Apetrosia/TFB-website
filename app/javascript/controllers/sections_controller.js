import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["topic", "but"]
    static values = { sectionid:  Number}

    connect(){
        console.log("Hello ");
    }
    initialize() {
        this.butTarget.hidden = true;
        this.topicTargets.hidden = true;
    }

    clickOnSection({params: {sectid}}) {
        this.topicTargets.forEach( (elem) => {
            if ( elem.sectionidValue == sectid)
            {
                if (elem.hidden)
                    elem.hidden = false
                else
                    elem.hidden = true
            }

        })
    }
}