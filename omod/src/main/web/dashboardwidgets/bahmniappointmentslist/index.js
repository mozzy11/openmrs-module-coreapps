import angular from 'angular';
import openmrsApi from '@openmrs/angularjs-openmrs-api';
import commons from './../dashboardwidgets.services';
import openmrsTranslate from '@openmrs/angularjs-openmrs-api';

import { BahmniAppointmentsListComponent } from './bahmniappointmentslist.component';


export default angular.module("openmrs-contrib-dashboardwidgets.appointments", [ openmrsApi, commons , openmrsTranslate])
	.component(BahmniAppointmentsListComponent.selector, BahmniAppointmentsListComponent).name;