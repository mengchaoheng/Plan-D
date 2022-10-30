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
#include "linearOutputBus_bus.h"

/* %%%-SFUNWIZ_wrapper_includes_Changes_BEGIN --- EDIT HERE TO _END */
#include <math.h>
/* %%%-SFUNWIZ_wrapper_includes_Changes_END --- EDIT HERE TO _BEGIN */
#define u_width 33
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
void linearOutputBus_Outputs_wrapper(const real_T *u,
                          StatesBus *StatesOut)
{
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_BEGIN --- EDIT HERE TO _END */
/* This output is set up for a specific run of the trimLinearizeOpPoint 
 * script. It maps the outputs of the State Space model block to the States
 * bus. Indices for each of the variables are zero-based.
*/
int acc_id, vel_id, eul_id, dom_id, om_id, ve_id, xe_id, lla_id, dcbe_id;
int k;

/* Acceleration Body Vector Index */
acc_id = 0;
/* Velocity in NED coordinates Vector Index*/
ve_id = 24;
/* Position in NED coordinates Vector Index*/
xe_id = 27;
/* Latitude, Longitude, and Altitude Vector Index*/
lla_id = 15;
/* Euler Angles Vector Index*/
eul_id = 12;
/* DCM NED to Body Reference Frame Matrix Index*/
dcbe_id = 3;
/* Angular Rates Vector Index*/
om_id = 18;
/* Angular Acceleration Vector Index*/
dom_id = 30;
/* Velocity Body Vector Index*/
vel_id = 21;

/* Vector asignment*/
for (k=0;k<3;k++){
    StatesOut->Accel_body[k] = u[acc_id+k];
    StatesOut->V_body[k] = u[vel_id+k];
    StatesOut->Omega_body[k] = u[om_id+k];
    StatesOut->dOmega_body[k] = u[dom_id+k];
    StatesOut->V_ned[k] = u[ve_id+k];
    StatesOut->X_ned[k] = u[xe_id+k];
    StatesOut->Euler[k] = u[eul_id+k];
    StatesOut->LLA[k] = u[lla_id+k];
}

/* Matrix assignment*/
for (k=0;k<9;k++){
    StatesOut->DCM_be[k] = u[dcbe_id+k];
}
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_END --- EDIT HERE TO _BEGIN */
}
