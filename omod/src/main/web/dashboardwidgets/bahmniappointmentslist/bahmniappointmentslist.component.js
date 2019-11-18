import BahmniAppointmentsListController from './bahmniappointmentslist.controller';
import template from './bahmniappointmentslist.html';

export let BahmniAppointmentsListComponent = {
    template,
    controller: BahmniAppointmentsListController,
    selector: 'bahmniappointmentslist',
    bindings: {
        config: '<'
    }
};