package com.rururu.lifebt

import es.antonborri.home_widget.HomeWidgetGlanceWidgetReceiver

class LifeBatteryWidgetReceiver : HomeWidgetGlanceWidgetReceiver<LifeBatteryWidget>() {
    override val glanceAppWidget = LifeBatteryWidget()
}
