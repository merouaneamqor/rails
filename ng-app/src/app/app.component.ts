import { BrowserModule } from '@angular/platform-browser';
import { Component, NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  query = '';
  results = [];

  search(event: Event) {
    event.preventDefault();
    // Make API call or search from the database here
    // and populate the "results" array with the results
    this.results = [

    ];
  }
}