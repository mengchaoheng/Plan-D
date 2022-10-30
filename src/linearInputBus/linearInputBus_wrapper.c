/* Copyright 2013 The MathWorks, Inc.*/

/*
 * Include Files
 *
 */
#if defined(MATLAB_MEX_FILE)
#include "tmwtypes.h"
#include "simstruc_types.h"
#else
#include "rtwtypes.h"
#endif
#include "linearInputBus_bus.h"

/* %%%-SFUNWIZ_wrapper_includes_Changes_BEGIN --- EDIT HERE TO _END */
#include <math.h>
/* %%%-SFUNWIZ_wrapper_includes_Changes_END --- EDIT HERE TO _BEGIN */
#define u_width 4
#define y_width 1
/*
 * Create external references here.  
 *
 */
/* %%%-SFUNWIZ_wrapper_externs_Changes_BEGIN --- EDIT HERE TO _END */
/* extern double func(double a); */
/* %%%-SFUNWIZ_wrapper_externs_Changes_END --- EDIT HERE TO _BEGIN */

/*
 * Output functions
 *
 */
void linearInputBus_Outputs_wrapper(const real_T *Actuators,
			const EnvironmentBus *Environment,
			const real_T *ActuatorsTrim,
			const real_T *AirDensityTrim,
			const real_T *AirTempTrim,
			const real_T *PressureTrim,
			const real_T *SpeedOfSoundTrim,
			const real_T *GravityNEDTrim,
			const real_T *MagneticFieldNEDTrim,
			real_T *y)
{
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_BEGIN --- EDIT HERE TO _END */
/* This output is set up for a specific run of the trimLinearizeOpPoint 
 * script. It maps the Environment bus and actuator inputs to a vector so
 * it can be used by the State Space model block.
*/
y[0] = Actuators[0]-ActuatorsTrim[0];
y[1] = Actuators[1]-ActuatorsTrim[1];
y[2] = Actuators[2]-ActuatorsTrim[2];
y[3] = Actuators[3]-ActuatorsTrim[3];
y[4] = Environment->AtmosphereBus.air_density-AirDensityTrim[0];
y[5] = Environment->AtmosphereBus.air_temp-AirTempTrim[0];
y[6] = Environment->AtmosphereBus.pressure-PressureTrim[0];
y[7] = Environment->AtmosphereBus.speed_sound-SpeedOfSoundTrim[0];
y[8] = Environment->Gravity_ned[0]-GravityNEDTrim[0];
y[9] = Environment->Gravity_ned[1]-GravityNEDTrim[1];
y[10] = Environment->Gravity_ned[2]-GravityNEDTrim[2];
y[11] = Environment->MagneticField_ned[0]-MagneticFieldNEDTrim[0];
y[12] = Environment->MagneticField_ned[1]-MagneticFieldNEDTrim[1];
y[13] = Environment->MagneticField_ned[2]-MagneticFieldNEDTrim[2];
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_END --- EDIT HERE TO _BEGIN */
}
