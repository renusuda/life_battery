package com.rururu.lifebt

import android.content.Context
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.glance.GlanceId
import androidx.glance.GlanceModifier
import androidx.glance.GlanceTheme
import androidx.glance.LocalContext
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.cornerRadius
import androidx.glance.appwidget.provideContent
import androidx.glance.background
import androidx.glance.currentState
import androidx.glance.layout.Alignment
import androidx.glance.layout.Box
import androidx.glance.layout.Column
import androidx.glance.layout.Row
import androidx.glance.layout.Spacer
import androidx.glance.layout.fillMaxSize
import androidx.glance.layout.height
import androidx.glance.layout.padding
import androidx.glance.layout.width
import androidx.glance.text.FontWeight
import androidx.glance.text.Text
import androidx.glance.text.TextAlign
import androidx.glance.text.TextStyle
import androidx.glance.unit.ColorProvider
import es.antonborri.home_widget.HomeWidgetGlanceState
import es.antonborri.home_widget.HomeWidgetGlanceStateDefinition
import java.time.LocalDate
import java.time.format.DateTimeFormatter
import java.time.temporal.ChronoUnit
import kotlin.math.ceil

class LifeBatteryWidget : GlanceAppWidget() {
    override val stateDefinition = HomeWidgetGlanceStateDefinition()

    override suspend fun provideGlance(
        context: Context,
        id: GlanceId,
    ) {
        provideContent {
            GlanceTheme {
                Content()
            }
        }
    }

    @Composable
    private fun Content() {
        val context = LocalContext.current
        val state = currentState<HomeWidgetGlanceState>()
        val percentage = computePercentage(state)
        val fillColor = batteryColor(percentage)
        val borderColor = GlanceTheme.colors.onBackground
        val innerBgColor = GlanceTheme.colors.background
        val textColor = GlanceTheme.colors.onBackground

        Column(
            modifier =
                GlanceModifier
                    .fillMaxSize()
                    .background(GlanceTheme.colors.widgetBackground)
                    .padding(12.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalAlignment = Alignment.CenterVertically,
        ) {
            Text(
                text = context.getString(R.string.widget_title),
                style =
                    TextStyle(
                        fontWeight = FontWeight.Bold,
                        fontSize = 14.sp,
                        textAlign = TextAlign.Center,
                        color = GlanceTheme.colors.onBackground,
                    ),
            )
            Spacer(modifier = GlanceModifier.height(8.dp))
            Row(
                verticalAlignment = Alignment.CenterVertically,
            ) {
                BatteryBody(percentage, fillColor, borderColor, innerBgColor, textColor)
                Spacer(modifier = GlanceModifier.width(2.dp))
                BatteryKnob(borderColor)
            }
        }
    }

    @Composable
    private fun BatteryBody(
        percentage: Int,
        fillColor: Color,
        borderColor: ColorProvider,
        innerBgColor: ColorProvider,
        textColor: ColorProvider,
    ) {
        val innerWidth = 116
        val fillWidth =
            (percentage.toFloat() / 100f * innerWidth)
                .toInt()
                .coerceIn(0, innerWidth)
        val fillCornerRadius = 9

        Box(
            modifier =
                GlanceModifier
                    .height(60.dp)
                    .width(132.dp)
                    .cornerRadius(16.dp)
                    .background(borderColor),
            contentAlignment = Alignment.Center,
        ) {
            Box(
                modifier =
                    GlanceModifier
                        .height(54.dp)
                        .width(126.dp)
                        .cornerRadius(13.dp)
                        .background(innerBgColor)
                        .padding(4.dp),
                contentAlignment = Alignment.CenterStart,
            ) {
                if (fillWidth > 0) {
                    Box(
                        modifier =
                            GlanceModifier
                                .height(46.dp)
                                .width(fillWidth.dp)
                                .cornerRadius(fillCornerRadius.dp)
                                .background(fillColor),
                    ) {}
                }
                Box(
                    modifier =
                        GlanceModifier
                            .fillMaxSize(),
                    contentAlignment = Alignment.Center,
                ) {
                    Text(
                        text = "$percentage%",
                        style =
                            TextStyle(
                                fontWeight = FontWeight.Bold,
                                fontSize = 28.sp,
                                textAlign = TextAlign.Center,
                                color = textColor,
                            ),
                    )
                }
            }
        }
    }

    @Composable
    private fun BatteryKnob(borderColor: ColorProvider) {
        Box(
            modifier =
                GlanceModifier
                    .width(8.dp)
                    .height(22.dp)
                    .cornerRadius(4.dp)
                    .background(borderColor),
        ) {}
    }

    private fun computePercentage(state: HomeWidgetGlanceState): Int {
        val birthDateStr =
            state.preferences.getString("birthDate", null)
                ?: return 0
        val idealAge = state.preferences.getInt("idealAge", 0)
        if (idealAge <= 0) return 0

        val birthDate =
            try {
                LocalDate.parse(
                    birthDateStr.substringBefore("T"),
                    DateTimeFormatter.ISO_LOCAL_DATE,
                )
            } catch (_: Exception) {
                return 0
            }

        val deathDate = birthDate.plusYears(idealAge.toLong())
        val today = LocalDate.now()

        val totalDays = ChronoUnit.DAYS.between(birthDate, deathDate)
        if (totalDays <= 0) return 0

        val remainingDays = ChronoUnit.DAYS.between(today, deathDate)
        if (remainingDays <= 0) return 0
        if (today.isBefore(birthDate)) return 100

        return ceil(remainingDays.toDouble() / totalDays.toDouble() * 100)
            .toInt()
            .coerceIn(0, 100)
    }

    private fun batteryColor(percentage: Int): Color =
        when {
            percentage > 50 -> Color(0xFF10B981)
            percentage >= 20 -> Color(0xFFFBBF24)
            else -> Color(0xFFF43F5E)
        }
}
