/*
 * File: linearOutputBus.c
 *
  *
  *   --- THIS FILE GENERATED BY S-FUNCTION BUILDER: 3.0 ---
  *
  *   This file is an S-function produced by the S-Function
  *   Builder which only recognizes certain fields.  Changes made
  *   outside these fields will be lost the next time the block is
  *   used to load, edit, and resave this file. This file will be overwritten
  *   by the S-function Builder block. If you want to edit this file by hand, 
  *   you must change it only in the area defined as:  
  *
  *        %%%-SFUNWIZ_defines_Changes_BEGIN
  *        #define NAME 'replacement text' 
  *        %%% SFUNWIZ_defines_Changes_END
  *
  *   DO NOT change NAME--Change the 'replacement text' only.
  *
  *   For better compatibility with the Simulink Coder, the
  *   "wrapper" S-function technique is used.  This is discussed
  *   in the Simulink Coder's Manual in the Chapter titled,
  *   "Wrapper S-functions".
  *
  *  -------------------------------------------------------------------------
  * | See matlabroot/simulink/src/sfuntmpl_doc.c for a more detailed template |
  *  ------------------------------------------------------------------------- 
* Created: Thu Nov 14 10:41:58 2013
*/

/* Copyright 2013-2017 The MathWorks, Inc.*/

#define S_FUNCTION_LEVEL 2
#define S_FUNCTION_NAME linearOutputBus
/*<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<*/
/* %%%-SFUNWIZ_defines_Changes_BEGIN --- EDIT HERE TO _END */
#define NUM_INPUTS          1
/* Input Port  0 */
#define IN_PORT_0_NAME      u
#define INPUT_0_WIDTH       33
#define INPUT_DIMS_0_COL    1
#define INPUT_0_DTYPE       real_T
#define INPUT_0_COMPLEX     COMPLEX_NO
#define IN_0_FRAME_BASED    FRAME_NO
#define IN_0_BUS_BASED      0
#define IN_0_BUS_NAME       
#define IN_0_DIMS           1-D
#define INPUT_0_FEEDTHROUGH 1
#define IN_0_ISSIGNED        0
#define IN_0_WORDLENGTH      8
#define IN_0_FIXPOINTSCALING 1
#define IN_0_FRACTIONLENGTH  9
#define IN_0_BIAS            0
#define IN_0_SLOPE           0.125

#define NUM_OUTPUTS          1
/* Output Port  0 */
#define OUT_PORT_0_NAME      StatesOut
#define OUTPUT_0_WIDTH       1
#define OUTPUT_DIMS_0_COL    1
#define OUTPUT_0_DTYPE       real_T
#define OUTPUT_0_COMPLEX     COMPLEX_NO
#define OUT_0_FRAME_BASED    FRAME_NO
#define OUT_0_BUS_BASED      1
#define OUT_0_BUS_NAME       StatesBus
#define OUT_0_DIMS           1-D
#define OUT_0_ISSIGNED        1
#define OUT_0_WORDLENGTH      8
#define OUT_0_FIXPOINTSCALING 1
#define OUT_0_FRACTIONLENGTH  3
#define OUT_0_BIAS            0
#define OUT_0_SLOPE           0.125

#define NPARAMS              0

#define SAMPLE_TIME_0        INHERITED_SAMPLE_TIME
#define NUM_DISC_STATES      0
#define DISC_STATES_IC       [0]
#define NUM_CONT_STATES      0
#define CONT_STATES_IC       [0]

#define SFUNWIZ_GENERATE_TLC 1
#define SOURCEFILES "__SFB__"
#define PANELINDEX           6
#define USE_SIMSTRUCT        0
#define SHOW_COMPILE_STEPS   1                   
#define CREATE_DEBUG_MEXFILE 1
#define SAVE_CODE_ONLY       0
#define SFUNWIZ_REVISION     3.0
/* %%%-SFUNWIZ_defines_Changes_END --- EDIT HERE TO _BEGIN */
/*<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<*/
#include "simstruc.h"
#include "linearOutputBus_bus.h"
/*
* Code Generation Environment flag (simulation or standalone target).
 */
static int_T isSimulationTarget;
/*  Utility function prototypes. */
static int_T GetRTWEnvironmentMode(SimStruct *S);
/* Macro used to check if Simulation mode is set to accelerator */
#define isDWorkPresent !(ssRTWGenIsCodeGen(S) && !isSimulationTarget)

extern void linearOutputBus_Outputs_wrapper(const real_T *u,
                          StatesBus *StatesOut);

/*====================*
 * S-function methods *
 *====================*/
/* Function: mdlInitializeSizes ===============================================
 * Abstract:
 *   Setup sizes of the various vectors.
 */
static void mdlInitializeSizes(SimStruct *S)
{

    DECL_AND_INIT_DIMSINFO(inputDimsInfo);
    DECL_AND_INIT_DIMSINFO(outputDimsInfo);
    ssSetNumSFcnParams(S, NPARAMS);
     if (ssGetNumSFcnParams(S) != ssGetSFcnParamsCount(S)) {
	 return; /* Parameter mismatch will be reported by Simulink */
     }

    ssSetNumContStates(S, NUM_CONT_STATES);
    ssSetNumDiscStates(S, NUM_DISC_STATES);

    if (!ssSetNumInputPorts(S, NUM_INPUTS)) return;
    inputDimsInfo.width = INPUT_0_WIDTH;
    ssSetInputPortDimensionInfo(S, 0, &inputDimsInfo);
    ssSetInputPortFrameData(S, 0, IN_0_FRAME_BASED);
    ssSetInputPortDataType(S, 0, SS_DOUBLE);
    ssSetInputPortComplexSignal(S, 0, INPUT_0_COMPLEX);
    ssSetInputPortDirectFeedThrough(S, 0, INPUT_0_FEEDTHROUGH);
    ssSetInputPortRequiredContiguous(S, 0, 1); /*direct input signal access*/

    if (!ssSetNumOutputPorts(S, NUM_OUTPUTS)) return;

  /* Register StatesBus datatype for Output port 0 */

  #if defined(MATLAB_MEX_FILE)
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY)
    {
      DTypeId dataTypeIdReg;
      ssRegisterTypeFromNamedObject(S, "StatesBus", &dataTypeIdReg);
      if(dataTypeIdReg == INVALID_DTYPE_ID) return;
        ssSetOutputPortDataType(S,0, dataTypeIdReg);
    }
    #endif

    ssSetBusOutputObjectName(S, 0, (void *) "StatesBus");
    ssSetOutputPortWidth(S, 0, OUTPUT_0_WIDTH);
    ssSetOutputPortComplexSignal(S, 0, OUTPUT_0_COMPLEX);
    ssSetBusOutputAsStruct(S, 0,OUT_0_BUS_BASED);
    ssSetOutputPortBusMode(S, 0, SL_BUS_MODE);
    if (ssRTWGenIsCodeGen(S)) {
       isSimulationTarget = GetRTWEnvironmentMode(S);
    if (isSimulationTarget==-1) {
       ssSetErrorStatus(S, " Unable to determine a valid code generation environment mode");
       return;
     }
       isSimulationTarget |= ssRTWGenIsModelReferenceSimTarget(S);
    }
  
    /* Set the number of dworks */
    if (!isDWorkPresent) {
      if (!ssSetNumDWork(S, 0)) return;
    } else {
      if (!ssSetNumDWork(S, 1)) return;
    }


   if (isDWorkPresent) {
   
    /*
     * Configure the dwork 0 (y0BUS)
     */
#if defined(MATLAB_MEX_FILE)

    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      DTypeId dataTypeIdReg;
      ssRegisterTypeFromNamedObject(S, "StatesBus", &dataTypeIdReg);
      if (dataTypeIdReg == INVALID_DTYPE_ID) return;
      ssSetDWorkDataType(S, 0, dataTypeIdReg);
    }

#endif

    ssSetDWorkUsageType(S, 0, SS_DWORK_USED_AS_DWORK);
    ssSetDWorkName(S, 0, "y0BUS");
    ssSetDWorkWidth(S, 0, DYNAMICALLY_SIZED);
    ssSetDWorkComplexSignal(S, 0, COMPLEX_NO);
}
    ssSetNumSampleTimes(S, 1);
    ssSetNumRWork(S, 0);
    ssSetNumIWork(S, 0);
    ssSetNumPWork(S, 0);
    ssSetNumModes(S, 0);
    ssSetNumNonsampledZCs(S, 0);

    /* Take care when specifying exception free code - see sfuntmpl_doc.c */
    ssSetOptions(S, (SS_OPTION_EXCEPTION_FREE_CODE |
                     SS_OPTION_USE_TLC_WITH_ACCELERATOR | 
		     SS_OPTION_WORKS_WITH_CODE_REUSE));
}

#if defined(MATLAB_MEX_FILE)
#define MDL_SET_INPUT_PORT_DIMENSION_INFO
static void mdlSetInputPortDimensionInfo(SimStruct        *S, 
                                         int_T            port,
                                         const DimsInfo_T *dimsInfo)
{
    if(!ssSetInputPortDimensionInfo(S, port, dimsInfo)) return;
}
#endif

#define MDL_SET_OUTPUT_PORT_DIMENSION_INFO
#if defined(MDL_SET_OUTPUT_PORT_DIMENSION_INFO)
static void mdlSetOutputPortDimensionInfo(SimStruct        *S, 
                                          int_T            port, 
                                          const DimsInfo_T *dimsInfo)
{
 if (!ssSetOutputPortDimensionInfo(S, port, dimsInfo)) return;
}
#endif
#define MDL_SET_DEFAULT_PORT_DIMENSION_INFO
static void mdlSetDefaultPortDimensionInfo(SimStruct *S)
{
  DECL_AND_INIT_DIMSINFO(portDimsInfo);
  int_T dims[2] = { INPUT_0_WIDTH, 1 };
  bool  frameIn = ssGetInputPortFrameData(S, 0) == FRAME_YES;

  /* Neither the input nor the output ports have been set */

  portDimsInfo.width   = INPUT_0_WIDTH;
  portDimsInfo.numDims = frameIn ? 2 : 1;
  portDimsInfo.dims    = frameIn ? dims : &portDimsInfo.width;
  if (ssGetInputPortNumDimensions(S, 0) == (-1)) {  
   ssSetInputPortDimensionInfo(S, 0, &portDimsInfo);
  }
  portDimsInfo.width   = OUTPUT_0_WIDTH;
  dims[0]              = OUTPUT_0_WIDTH;
  dims[1]              = 1;
  portDimsInfo.dims    = frameIn ? dims : &portDimsInfo.width;
 if (ssGetOutputPortNumDimensions(S, 0) == (-1)) {  
  ssSetOutputPortDimensionInfo(S, 0, &portDimsInfo);
 }
  return;
}
# define MDL_SET_INPUT_PORT_FRAME_DATA
static void mdlSetInputPortFrameData(SimStruct  *S, 
                                     int_T      port,
                                     Frame_T    frameData)
{
    ssSetInputPortFrameData(S, port, frameData);
}
/* Function: mdlInitializeSampleTimes =========================================
 * Abstract:
 *    Specifiy  the sample time.
 */
static void mdlInitializeSampleTimes(SimStruct *S)
{
    ssSetSampleTime(S, 0, SAMPLE_TIME_0);
    ssSetOffsetTime(S, 0, 0.0);
}


#define MDL_START  /* Change to #undef to remove function */
#if defined(MDL_START)
  /* Function: mdlStart =======================================================
   * Abstract:
   *    This function is called once at start of model execution. If you
   *    have states that should be initialized once, this is the place
   *    to do it.
   */
static void mdlStart(SimStruct *S)
{
    /* Bus Information */
    slDataTypeAccess *dta = ssGetDataTypeAccess(S);
    const char *bpath = ssGetPath(S);
	DTypeId StatesBusId = ssGetDataTypeId(S, "StatesBus");

	int_T *busInfo = (int_T *)malloc(18*sizeof(int_T));
	if(busInfo==NULL) {
        ssSetErrorStatus(S, "Memory allocation failure");
        return;
    }

      /* Calculate offsets of all primitive elements of the bus */

	busInfo[0] = dtaGetDataTypeElementOffset(dta, bpath,StatesBusId,0);
	busInfo[1] = 3 * dtaGetDataTypeSize(dta, bpath, ssGetDataTypeId(S, "double"));
	busInfo[2] = dtaGetDataTypeElementOffset(dta, bpath,StatesBusId,1);
	busInfo[3] = 3 * dtaGetDataTypeSize(dta, bpath, ssGetDataTypeId(S, "double"));
	busInfo[4] = dtaGetDataTypeElementOffset(dta, bpath,StatesBusId,2);
	busInfo[5] = 3 * dtaGetDataTypeSize(dta, bpath, ssGetDataTypeId(S, "double"));
	busInfo[6] = dtaGetDataTypeElementOffset(dta, bpath,StatesBusId,3);
	busInfo[7] = 3 * dtaGetDataTypeSize(dta, bpath, ssGetDataTypeId(S, "double"));
	busInfo[8] = dtaGetDataTypeElementOffset(dta, bpath,StatesBusId,4);
	busInfo[9] = 3 * dtaGetDataTypeSize(dta, bpath, ssGetDataTypeId(S, "double"));
	busInfo[10] = dtaGetDataTypeElementOffset(dta, bpath,StatesBusId,5);
	busInfo[11] = 3 * dtaGetDataTypeSize(dta, bpath, ssGetDataTypeId(S, "double"));
	busInfo[12] = dtaGetDataTypeElementOffset(dta, bpath,StatesBusId,6);
	busInfo[13] = 3 * dtaGetDataTypeSize(dta, bpath, ssGetDataTypeId(S, "double"));
	busInfo[14] = dtaGetDataTypeElementOffset(dta, bpath,StatesBusId,7);
	busInfo[15] = 3 * dtaGetDataTypeSize(dta, bpath, ssGetDataTypeId(S, "double"));
	busInfo[16] = dtaGetDataTypeElementOffset(dta, bpath,StatesBusId,8);
	busInfo[17] = 9 * dtaGetDataTypeSize(dta, bpath, ssGetDataTypeId(S, "double"));
	ssSetUserData(S, busInfo);
}
#endif /*  MDL_START */

#define MDL_SET_INPUT_PORT_DATA_TYPE
static void mdlSetInputPortDataType(SimStruct *S, int port, DTypeId dType)
{
    ssSetInputPortDataType( S, 0, dType);
}
#define MDL_SET_OUTPUT_PORT_DATA_TYPE
static void mdlSetOutputPortDataType(SimStruct *S, int port, DTypeId dType)
{
    ssSetOutputPortDataType(S, 0, dType);
}

#define MDL_SET_DEFAULT_PORT_DATA_TYPES
static void mdlSetDefaultPortDataTypes(SimStruct *S)
{
  ssSetInputPortDataType( S, 0, SS_DOUBLE);
 ssSetOutputPortDataType(S, 0, SS_DOUBLE);
}

#define MDL_SET_WORK_WIDTHS
#if defined(MDL_SET_WORK_WIDTHS) && defined(MATLAB_MEX_FILE)

static void mdlSetWorkWidths(SimStruct *S)
{
/* Set the width of DWork(s) used for marshalling the IOs */
  if (isDWorkPresent) {

     /* Update dwork 0 */
     ssSetDWorkWidth(S, 0, ssGetOutputPortWidth(S, 0));
        
    }

}

#endif
/* Function: mdlOutputs =======================================================
 *
*/
static void mdlOutputs(SimStruct *S, int_T tid)
{
    const real_T   *u  = (const real_T*) ssGetInputPortSignal(S,0);
    char *StatesOut = (char *) ssGetOutputPortSignal(S,0);

	int_T* busInfo = (int_T *) ssGetUserData(S);

	/* Temporary bus copy declarations */
	StatesBus _y0BUS;

	/*Copy input bus into temporary structure*/
	
	linearOutputBus_Outputs_wrapper(u, &_y0BUS);

	/*Copy temporary structure into output bus*/
	(void) memcpy(StatesOut+ busInfo[0], _y0BUS.V_body, busInfo[1]);
	(void) memcpy(StatesOut+ busInfo[2], _y0BUS.Omega_body, busInfo[3]);
	(void) memcpy(StatesOut+ busInfo[4], _y0BUS.Euler, busInfo[5]);
	(void) memcpy(StatesOut+ busInfo[6], _y0BUS.Accel_body, busInfo[7]);
	(void) memcpy(StatesOut+ busInfo[8], _y0BUS.dOmega_body, busInfo[9]);
	(void) memcpy(StatesOut+ busInfo[10], _y0BUS.V_ned, busInfo[11]);
	(void) memcpy(StatesOut+ busInfo[12], _y0BUS.X_ned, busInfo[13]);
	(void) memcpy(StatesOut+ busInfo[14], _y0BUS.LLA, busInfo[15]);
	(void) memcpy(StatesOut+ busInfo[16], _y0BUS.DCM_be, busInfo[17]);
}



/* Function: mdlTerminate =====================================================
 * Abstract:
 *    In this function, you should perform any actions that are necessary
 *    at the termination of a simulation.  For example, if memory was
 *    allocated in mdlStart, this is the place to free it.
 */
static void mdlTerminate(SimStruct *S)
{
    /*Free stored bus information*/
    int_T *busInfo = (int_T *) ssGetUserData(S);
    if(busInfo!=NULL) {
      free(busInfo);
    }
}


static int_T GetRTWEnvironmentMode(SimStruct *S)
{
    int_T status;
    mxArray *plhs[1];
    mxArray *prhs[1];
    mxArray * err;
    
    /*
      * Get the name of the Simulink block diagram
    */
    prhs[0] = mxCreateString(ssGetModelName(ssGetRootSS(S)));
    plhs[0] = NULL;
    
    /*
      * Call "isSimulationTarget = rtwenvironmentmode(modelName)" in MATLAB
    */
    err = mexCallMATLABWithTrap(1, plhs, 1, prhs, "rtwenvironmentmode");
    mxDestroyArray(prhs[0]);
    
    /*
     * Set the error status if an error occurred
    */
    if (err) {
        if (plhs[0]) {
            mxDestroyArray(plhs[0]);
            plhs[0] = NULL;
        }
        ssSetErrorStatus(S, "Unknow error during call to 'rtwenvironmentmode'.");
        return -1;
    }
    
    /*
      * Get the value returned by rtwenvironmentmode(modelName)
    */
   if (plhs[0]) {
       status = (int_T) (mxGetScalar(plhs[0]) != 0);
       mxDestroyArray(plhs[0]);
       plhs[0] = NULL;
   }
    
    return (status);
}

#ifdef  MATLAB_MEX_FILE    /* Is this file being compiled as a MEX-file? */
#include "simulink.c"      /* MEX-file interface mechanism */
#else
#include "cg_sfun.h"       /* Code generation registration function */
#endif


