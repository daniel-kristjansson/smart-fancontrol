??
??
B
AssignVariableOp
resource
value"dtype"
dtypetype?
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(?

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype?
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
?
Select
	condition

t"T
e"T
output"T"	
Ttype
H
ShardedFilename
basename	
shard

num_shards
filename
?
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ?
@
StaticRegexFullMatch	
input

output
"
patternstring
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
?
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 ?"serve*2.6.22v2.6.1-9-gc2363d6d0258??
t
level/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*
shared_namelevel/kernel
m
 level/kernel/Read/ReadVariableOpReadVariableOplevel/kernel*
_output_shapes

:*
dtype0
l

level/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_name
level/bias
e
level/bias/Read/ReadVariableOpReadVariableOp
level/bias*
_output_shapes
:*
dtype0
f
	Adam/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	Adam/iter
_
Adam/iter/Read/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
j
Adam/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_1
c
Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
j
Adam/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_2
c
Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_output_shapes
: *
dtype0
h

Adam/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
Adam/decay
a
Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_output_shapes
: *
dtype0
x
Adam/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/learning_rate
q
&Adam/learning_rate/Read/ReadVariableOpReadVariableOpAdam/learning_rate*
_output_shapes
: *
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
?
Adam/level/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*$
shared_nameAdam/level/kernel/m
{
'Adam/level/kernel/m/Read/ReadVariableOpReadVariableOpAdam/level/kernel/m*
_output_shapes

:*
dtype0
z
Adam/level/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*"
shared_nameAdam/level/bias/m
s
%Adam/level/bias/m/Read/ReadVariableOpReadVariableOpAdam/level/bias/m*
_output_shapes
:*
dtype0
?
Adam/level/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*$
shared_nameAdam/level/kernel/v
{
'Adam/level/kernel/v/Read/ReadVariableOpReadVariableOpAdam/level/kernel/v*
_output_shapes

:*
dtype0
z
Adam/level/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*"
shared_nameAdam/level/bias/v
s
%Adam/level/bias/v/Read/ReadVariableOpReadVariableOpAdam/level/bias/v*
_output_shapes
:*
dtype0

NoOpNoOp
?
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*?
value?B? B?
?
layer-0
layer-1
layer-2
layer-3
layer-4
layer_with_weights-0
layer-5
	optimizer
	variables
	trainable_variables

regularization_losses
	keras_api

signatures
 
 
 
 
R
	variables
trainable_variables
regularization_losses
	keras_api
h

kernel
bias
	variables
trainable_variables
regularization_losses
	keras_api
d
iter

beta_1

beta_2
	decay
learning_ratem0m1v2v3

0
1

0
1
 
?
	variables

layers
layer_regularization_losses
non_trainable_variables
layer_metrics
 metrics
	trainable_variables

regularization_losses
 
 
 
 
?
	variables

!layers
"layer_regularization_losses
#non_trainable_variables
$layer_metrics
%metrics
trainable_variables
regularization_losses
XV
VARIABLE_VALUElevel/kernel6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE
TR
VARIABLE_VALUE
level/bias4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUE

0
1

0
1
 
?
	variables

&layers
'layer_regularization_losses
(non_trainable_variables
)layer_metrics
*metrics
trainable_variables
regularization_losses
HF
VARIABLE_VALUE	Adam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE
JH
VARIABLE_VALUE
Adam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE
ZX
VARIABLE_VALUEAdam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE
*
0
1
2
3
4
5
 
 
 

+0
 
 
 
 
 
 
 
 
 
 
4
	,total
	-count
.	variables
/	keras_api
OM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE
OM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE

,0
-1

.	variables
{y
VARIABLE_VALUEAdam/level/kernel/mRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
wu
VARIABLE_VALUEAdam/level/bias/mPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
{y
VARIABLE_VALUEAdam/level/kernel/vRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
wu
VARIABLE_VALUEAdam/level/bias/vPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
{
serving_default_cpu_idlePlaceholder*'
_output_shapes
:?????????*
dtype0*
shape:?????????
z
serving_default_fan_rpmPlaceholder*'
_output_shapes
:?????????*
dtype0*
shape:?????????
x
serving_default_powerPlaceholder*'
_output_shapes
:?????????*
dtype0*
shape:?????????
w
serving_default_tempPlaceholder*'
_output_shapes
:?????????
*
dtype0*
shape:?????????

?
StatefulPartitionedCallStatefulPartitionedCallserving_default_cpu_idleserving_default_fan_rpmserving_default_powerserving_default_templevel/kernel
level/bias*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *0
f+R)
'__inference_signature_wrapper_119416916
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
?
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename level/kernel/Read/ReadVariableOplevel/bias/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOp'Adam/level/kernel/m/Read/ReadVariableOp%Adam/level/bias/m/Read/ReadVariableOp'Adam/level/kernel/v/Read/ReadVariableOp%Adam/level/bias/v/Read/ReadVariableOpConst*
Tin
2	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *+
f&R$
"__inference__traced_save_119417071
?
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamelevel/kernel
level/bias	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotalcountAdam/level/kernel/mAdam/level/bias/mAdam/level/kernel/vAdam/level/bias/v*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *.
f)R'
%__inference__traced_restore_119417120??
?&
?
"__inference__traced_save_119417071
file_prefix+
'savev2_level_kernel_read_readvariableop)
%savev2_level_bias_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop2
.savev2_adam_level_kernel_m_read_readvariableop0
,savev2_adam_level_bias_m_read_readvariableop2
.savev2_adam_level_kernel_v_read_readvariableop0
,savev2_adam_level_bias_v_read_readvariableop
savev2_const

identity_1??MergeV2Checkpoints?
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*2
StaticRegexFullMatchc
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.part2
Constl
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part2	
Const_1?
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: 2
Selectt

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: 2

StringJoinZ

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :2

num_shards
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 2
ShardedFilename/shard?
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 2
ShardedFilename?
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*?
value?B?B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
SaveV2/tensor_names?
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*/
value&B$B B B B B B B B B B B B B B 2
SaveV2/shape_and_slices?
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0'savev2_level_kernel_read_readvariableop%savev2_level_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop.savev2_adam_level_kernel_m_read_readvariableop,savev2_adam_level_bias_m_read_readvariableop.savev2_adam_level_kernel_v_read_readvariableop,savev2_adam_level_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *
dtypes
2	2
SaveV2?
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:2(
&MergeV2Checkpoints/checkpoint_prefixes?
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 2
MergeV2Checkpointsr
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 2

Identity_

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: 2

Identity_1c
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"!

identity_1Identity_1:output:0*U
_input_shapesD
B: ::: : : : : : : ::::: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:$ 

_output_shapes

:: 

_output_shapes
::

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :	

_output_shapes
: :$
 

_output_shapes

:: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::

_output_shapes
: 
?
?
D__inference_model_layer_call_and_return_conditional_losses_119416883	
power
temp
cpu_idle
fan_rpm!
level_119416877:
level_119416879:
identity??level/StatefulPartitionedCall?
concatenate/PartitionedCallPartitionedCallpowertempcpu_idlefan_rpm*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *S
fNRL
J__inference_concatenate_layer_call_and_return_conditional_losses_1194167762
concatenate/PartitionedCall?
level/StatefulPartitionedCallStatefulPartitionedCall$concatenate/PartitionedCall:output:0level_119416877level_119416879*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_level_layer_call_and_return_conditional_losses_1194167882
level/StatefulPartitionedCall?
IdentityIdentity&level/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identityn
NoOpNoOp^level/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*c
_input_shapesR
P:?????????:?????????
:?????????:?????????: : 2>
level/StatefulPartitionedCalllevel/StatefulPartitionedCall:N J
'
_output_shapes
:?????????

_user_specified_namepower:MI
'
_output_shapes
:?????????


_user_specified_nametemp:QM
'
_output_shapes
:?????????
"
_user_specified_name
cpu_idle:PL
'
_output_shapes
:?????????
!
_user_specified_name	fan_rpm
?

?
'__inference_signature_wrapper_119416916
cpu_idle
fan_rpm	
power
temp
unknown:
	unknown_0:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallpowertempcpu_idlefan_rpmunknown	unknown_0*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *-
f(R&
$__inference__wrapped_model_1194167542
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*c
_input_shapesR
P:?????????:?????????:?????????:?????????
: : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
'
_output_shapes
:?????????
"
_user_specified_name
cpu_idle:PL
'
_output_shapes
:?????????
!
_user_specified_name	fan_rpm:NJ
'
_output_shapes
:?????????

_user_specified_namepower:MI
'
_output_shapes
:?????????


_user_specified_nametemp
?

?
)__inference_model_layer_call_fn_119416940
inputs_0
inputs_1
inputs_2
inputs_3
unknown:
	unknown_0:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputs_1inputs_2inputs_3unknown	unknown_0*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_model_layer_call_and_return_conditional_losses_1194168512
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*c
_input_shapesR
P:?????????:?????????
:?????????:?????????: : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
'
_output_shapes
:?????????
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:?????????

"
_user_specified_name
inputs/1:QM
'
_output_shapes
:?????????
"
_user_specified_name
inputs/2:QM
'
_output_shapes
:?????????
"
_user_specified_name
inputs/3
?:
?
%__inference__traced_restore_119417120
file_prefix/
assignvariableop_level_kernel:+
assignvariableop_1_level_bias:&
assignvariableop_2_adam_iter:	 (
assignvariableop_3_adam_beta_1: (
assignvariableop_4_adam_beta_2: '
assignvariableop_5_adam_decay: /
%assignvariableop_6_adam_learning_rate: "
assignvariableop_7_total: "
assignvariableop_8_count: 8
&assignvariableop_9_adam_level_kernel_m:3
%assignvariableop_10_adam_level_bias_m:9
'assignvariableop_11_adam_level_kernel_v:3
%assignvariableop_12_adam_level_bias_v:
identity_14??AssignVariableOp?AssignVariableOp_1?AssignVariableOp_10?AssignVariableOp_11?AssignVariableOp_12?AssignVariableOp_2?AssignVariableOp_3?AssignVariableOp_4?AssignVariableOp_5?AssignVariableOp_6?AssignVariableOp_7?AssignVariableOp_8?AssignVariableOp_9?
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*?
value?B?B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
RestoreV2/tensor_names?
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*/
value&B$B B B B B B B B B B B B B B 2
RestoreV2/shape_and_slices?
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*L
_output_shapes:
8::::::::::::::*
dtypes
2	2
	RestoreV2g
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:2

Identity?
AssignVariableOpAssignVariableOpassignvariableop_level_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOpk

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:2

Identity_1?
AssignVariableOp_1AssignVariableOpassignvariableop_1_level_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_1k

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0	*
_output_shapes
:2

Identity_2?
AssignVariableOp_2AssignVariableOpassignvariableop_2_adam_iterIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	2
AssignVariableOp_2k

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:2

Identity_3?
AssignVariableOp_3AssignVariableOpassignvariableop_3_adam_beta_1Identity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_3k

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:2

Identity_4?
AssignVariableOp_4AssignVariableOpassignvariableop_4_adam_beta_2Identity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_4k

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:2

Identity_5?
AssignVariableOp_5AssignVariableOpassignvariableop_5_adam_decayIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_5k

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:2

Identity_6?
AssignVariableOp_6AssignVariableOp%assignvariableop_6_adam_learning_rateIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_6k

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:2

Identity_7?
AssignVariableOp_7AssignVariableOpassignvariableop_7_totalIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_7k

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:2

Identity_8?
AssignVariableOp_8AssignVariableOpassignvariableop_8_countIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_8k

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:2

Identity_9?
AssignVariableOp_9AssignVariableOp&assignvariableop_9_adam_level_kernel_mIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_9n
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:2
Identity_10?
AssignVariableOp_10AssignVariableOp%assignvariableop_10_adam_level_bias_mIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_10n
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:2
Identity_11?
AssignVariableOp_11AssignVariableOp'assignvariableop_11_adam_level_kernel_vIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_11n
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:2
Identity_12?
AssignVariableOp_12AssignVariableOp%assignvariableop_12_adam_level_bias_vIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_129
NoOpNoOp"/device:CPU:0*
_output_shapes
 2
NoOp?
Identity_13Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: 2
Identity_13f
Identity_14IdentityIdentity_13:output:0^NoOp_1*
T0*
_output_shapes
: 2
Identity_14?
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 2
NoOp_1"#
identity_14Identity_14:output:0*/
_input_shapes
: : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122(
AssignVariableOp_2AssignVariableOp_22(
AssignVariableOp_3AssignVariableOp_32(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
?
?
D__inference_model_layer_call_and_return_conditional_losses_119416851

inputs
inputs_1
inputs_2
inputs_3!
level_119416845:
level_119416847:
identity??level/StatefulPartitionedCall?
concatenate/PartitionedCallPartitionedCallinputsinputs_1inputs_2inputs_3*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *S
fNRL
J__inference_concatenate_layer_call_and_return_conditional_losses_1194167762
concatenate/PartitionedCall?
level/StatefulPartitionedCallStatefulPartitionedCall$concatenate/PartitionedCall:output:0level_119416845level_119416847*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_level_layer_call_and_return_conditional_losses_1194167882
level/StatefulPartitionedCall?
IdentityIdentity&level/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identityn
NoOpNoOp^level/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*c
_input_shapesR
P:?????????:?????????
:?????????:?????????: : 2>
level/StatefulPartitionedCalllevel/StatefulPartitionedCall:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs:OK
'
_output_shapes
:?????????

 
_user_specified_nameinputs:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?
?
)__inference_level_layer_call_fn_119416996

inputs
unknown:
	unknown_0:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_level_layer_call_and_return_conditional_losses_1194167882
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?

?
D__inference_level_layer_call_and_return_conditional_losses_119416788

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2	
BiasAddk
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?

?
)__inference_model_layer_call_fn_119416802	
power
temp
cpu_idle
fan_rpm
unknown:
	unknown_0:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallpowertempcpu_idlefan_rpmunknown	unknown_0*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_model_layer_call_and_return_conditional_losses_1194167952
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*c
_input_shapesR
P:?????????:?????????
:?????????:?????????: : 22
StatefulPartitionedCallStatefulPartitionedCall:N J
'
_output_shapes
:?????????

_user_specified_namepower:MI
'
_output_shapes
:?????????


_user_specified_nametemp:QM
'
_output_shapes
:?????????
"
_user_specified_name
cpu_idle:PL
'
_output_shapes
:?????????
!
_user_specified_name	fan_rpm
?
w
/__inference_concatenate_layer_call_fn_119416978
inputs_0
inputs_1
inputs_2
inputs_3
identity?
PartitionedCallPartitionedCallinputs_0inputs_1inputs_2inputs_3*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *S
fNRL
J__inference_concatenate_layer_call_and_return_conditional_losses_1194167762
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*_
_input_shapesN
L:?????????:?????????
:?????????:?????????:Q M
'
_output_shapes
:?????????
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:?????????

"
_user_specified_name
inputs/1:QM
'
_output_shapes
:?????????
"
_user_specified_name
inputs/2:QM
'
_output_shapes
:?????????
"
_user_specified_name
inputs/3
?

?
)__inference_model_layer_call_fn_119416870	
power
temp
cpu_idle
fan_rpm
unknown:
	unknown_0:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallpowertempcpu_idlefan_rpmunknown	unknown_0*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_model_layer_call_and_return_conditional_losses_1194168512
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*c
_input_shapesR
P:?????????:?????????
:?????????:?????????: : 22
StatefulPartitionedCallStatefulPartitionedCall:N J
'
_output_shapes
:?????????

_user_specified_namepower:MI
'
_output_shapes
:?????????


_user_specified_nametemp:QM
'
_output_shapes
:?????????
"
_user_specified_name
cpu_idle:PL
'
_output_shapes
:?????????
!
_user_specified_name	fan_rpm
?

?
)__inference_model_layer_call_fn_119416928
inputs_0
inputs_1
inputs_2
inputs_3
unknown:
	unknown_0:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputs_1inputs_2inputs_3unknown	unknown_0*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_model_layer_call_and_return_conditional_losses_1194167952
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*c
_input_shapesR
P:?????????:?????????
:?????????:?????????: : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
'
_output_shapes
:?????????
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:?????????

"
_user_specified_name
inputs/1:QM
'
_output_shapes
:?????????
"
_user_specified_name
inputs/2:QM
'
_output_shapes
:?????????
"
_user_specified_name
inputs/3
?
?
$__inference__wrapped_model_119416754	
power
temp
cpu_idle
fan_rpm<
*model_level_matmul_readvariableop_resource:9
+model_level_biasadd_readvariableop_resource:
identity??"model/level/BiasAdd/ReadVariableOp?!model/level/MatMul/ReadVariableOp?
model/concatenate/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
model/concatenate/concat/axis?
model/concatenate/concatConcatV2powertempcpu_idlefan_rpm&model/concatenate/concat/axis:output:0*
N*
T0*'
_output_shapes
:?????????2
model/concatenate/concat?
!model/level/MatMul/ReadVariableOpReadVariableOp*model_level_matmul_readvariableop_resource*
_output_shapes

:*
dtype02#
!model/level/MatMul/ReadVariableOp?
model/level/MatMulMatMul!model/concatenate/concat:output:0)model/level/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
model/level/MatMul?
"model/level/BiasAdd/ReadVariableOpReadVariableOp+model_level_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02$
"model/level/BiasAdd/ReadVariableOp?
model/level/BiasAddBiasAddmodel/level/MatMul:product:0*model/level/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
model/level/BiasAddw
IdentityIdentitymodel/level/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identity?
NoOpNoOp#^model/level/BiasAdd/ReadVariableOp"^model/level/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*c
_input_shapesR
P:?????????:?????????
:?????????:?????????: : 2H
"model/level/BiasAdd/ReadVariableOp"model/level/BiasAdd/ReadVariableOp2F
!model/level/MatMul/ReadVariableOp!model/level/MatMul/ReadVariableOp:N J
'
_output_shapes
:?????????

_user_specified_namepower:MI
'
_output_shapes
:?????????


_user_specified_nametemp:QM
'
_output_shapes
:?????????
"
_user_specified_name
cpu_idle:PL
'
_output_shapes
:?????????
!
_user_specified_name	fan_rpm
?

?
D__inference_level_layer_call_and_return_conditional_losses_119417006

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2	
BiasAddk
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?
?
D__inference_model_layer_call_and_return_conditional_losses_119416896	
power
temp
cpu_idle
fan_rpm!
level_119416890:
level_119416892:
identity??level/StatefulPartitionedCall?
concatenate/PartitionedCallPartitionedCallpowertempcpu_idlefan_rpm*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *S
fNRL
J__inference_concatenate_layer_call_and_return_conditional_losses_1194167762
concatenate/PartitionedCall?
level/StatefulPartitionedCallStatefulPartitionedCall$concatenate/PartitionedCall:output:0level_119416890level_119416892*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_level_layer_call_and_return_conditional_losses_1194167882
level/StatefulPartitionedCall?
IdentityIdentity&level/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identityn
NoOpNoOp^level/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*c
_input_shapesR
P:?????????:?????????
:?????????:?????????: : 2>
level/StatefulPartitionedCalllevel/StatefulPartitionedCall:N J
'
_output_shapes
:?????????

_user_specified_namepower:MI
'
_output_shapes
:?????????


_user_specified_nametemp:QM
'
_output_shapes
:?????????
"
_user_specified_name
cpu_idle:PL
'
_output_shapes
:?????????
!
_user_specified_name	fan_rpm
?
?
D__inference_model_layer_call_and_return_conditional_losses_119416970
inputs_0
inputs_1
inputs_2
inputs_36
$level_matmul_readvariableop_resource:3
%level_biasadd_readvariableop_resource:
identity??level/BiasAdd/ReadVariableOp?level/MatMul/ReadVariableOpt
concatenate/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concatenate/concat/axis?
concatenate/concatConcatV2inputs_0inputs_1inputs_2inputs_3 concatenate/concat/axis:output:0*
N*
T0*'
_output_shapes
:?????????2
concatenate/concat?
level/MatMul/ReadVariableOpReadVariableOp$level_matmul_readvariableop_resource*
_output_shapes

:*
dtype02
level/MatMul/ReadVariableOp?
level/MatMulMatMulconcatenate/concat:output:0#level/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
level/MatMul?
level/BiasAdd/ReadVariableOpReadVariableOp%level_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02
level/BiasAdd/ReadVariableOp?
level/BiasAddBiasAddlevel/MatMul:product:0$level/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
level/BiasAddq
IdentityIdentitylevel/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identity?
NoOpNoOp^level/BiasAdd/ReadVariableOp^level/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*c
_input_shapesR
P:?????????:?????????
:?????????:?????????: : 2<
level/BiasAdd/ReadVariableOplevel/BiasAdd/ReadVariableOp2:
level/MatMul/ReadVariableOplevel/MatMul/ReadVariableOp:Q M
'
_output_shapes
:?????????
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:?????????

"
_user_specified_name
inputs/1:QM
'
_output_shapes
:?????????
"
_user_specified_name
inputs/2:QM
'
_output_shapes
:?????????
"
_user_specified_name
inputs/3
?
?
D__inference_model_layer_call_and_return_conditional_losses_119416955
inputs_0
inputs_1
inputs_2
inputs_36
$level_matmul_readvariableop_resource:3
%level_biasadd_readvariableop_resource:
identity??level/BiasAdd/ReadVariableOp?level/MatMul/ReadVariableOpt
concatenate/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concatenate/concat/axis?
concatenate/concatConcatV2inputs_0inputs_1inputs_2inputs_3 concatenate/concat/axis:output:0*
N*
T0*'
_output_shapes
:?????????2
concatenate/concat?
level/MatMul/ReadVariableOpReadVariableOp$level_matmul_readvariableop_resource*
_output_shapes

:*
dtype02
level/MatMul/ReadVariableOp?
level/MatMulMatMulconcatenate/concat:output:0#level/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
level/MatMul?
level/BiasAdd/ReadVariableOpReadVariableOp%level_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02
level/BiasAdd/ReadVariableOp?
level/BiasAddBiasAddlevel/MatMul:product:0$level/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
level/BiasAddq
IdentityIdentitylevel/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identity?
NoOpNoOp^level/BiasAdd/ReadVariableOp^level/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*c
_input_shapesR
P:?????????:?????????
:?????????:?????????: : 2<
level/BiasAdd/ReadVariableOplevel/BiasAdd/ReadVariableOp2:
level/MatMul/ReadVariableOplevel/MatMul/ReadVariableOp:Q M
'
_output_shapes
:?????????
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:?????????

"
_user_specified_name
inputs/1:QM
'
_output_shapes
:?????????
"
_user_specified_name
inputs/2:QM
'
_output_shapes
:?????????
"
_user_specified_name
inputs/3
?
?
J__inference_concatenate_layer_call_and_return_conditional_losses_119416776

inputs
inputs_1
inputs_2
inputs_3
identity\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis?
concatConcatV2inputsinputs_1inputs_2inputs_3concat/axis:output:0*
N*
T0*'
_output_shapes
:?????????2
concatc
IdentityIdentityconcat:output:0*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*_
_input_shapesN
L:?????????:?????????
:?????????:?????????:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs:OK
'
_output_shapes
:?????????

 
_user_specified_nameinputs:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?
?
J__inference_concatenate_layer_call_and_return_conditional_losses_119416987
inputs_0
inputs_1
inputs_2
inputs_3
identity\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis?
concatConcatV2inputs_0inputs_1inputs_2inputs_3concat/axis:output:0*
N*
T0*'
_output_shapes
:?????????2
concatc
IdentityIdentityconcat:output:0*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*_
_input_shapesN
L:?????????:?????????
:?????????:?????????:Q M
'
_output_shapes
:?????????
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:?????????

"
_user_specified_name
inputs/1:QM
'
_output_shapes
:?????????
"
_user_specified_name
inputs/2:QM
'
_output_shapes
:?????????
"
_user_specified_name
inputs/3
?
?
D__inference_model_layer_call_and_return_conditional_losses_119416795

inputs
inputs_1
inputs_2
inputs_3!
level_119416789:
level_119416791:
identity??level/StatefulPartitionedCall?
concatenate/PartitionedCallPartitionedCallinputsinputs_1inputs_2inputs_3*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *S
fNRL
J__inference_concatenate_layer_call_and_return_conditional_losses_1194167762
concatenate/PartitionedCall?
level/StatefulPartitionedCallStatefulPartitionedCall$concatenate/PartitionedCall:output:0level_119416789level_119416791*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_level_layer_call_and_return_conditional_losses_1194167882
level/StatefulPartitionedCall?
IdentityIdentity&level/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identityn
NoOpNoOp^level/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*c
_input_shapesR
P:?????????:?????????
:?????????:?????????: : 2>
level/StatefulPartitionedCalllevel/StatefulPartitionedCall:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs:OK
'
_output_shapes
:?????????

 
_user_specified_nameinputs:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs"?L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*?
serving_default?
=
cpu_idle1
serving_default_cpu_idle:0?????????
;
fan_rpm0
serving_default_fan_rpm:0?????????
7
power.
serving_default_power:0?????????
5
temp-
serving_default_temp:0?????????
9
level0
StatefulPartitionedCall:0?????????tensorflow/serving/predict:?G
?
layer-0
layer-1
layer-2
layer-3
layer-4
layer_with_weights-0
layer-5
	optimizer
	variables
	trainable_variables

regularization_losses
	keras_api

signatures
4__call__
5_default_save_signature
*6&call_and_return_all_conditional_losses"
_tf_keras_network
"
_tf_keras_input_layer
"
_tf_keras_input_layer
"
_tf_keras_input_layer
"
_tf_keras_input_layer
?
	variables
trainable_variables
regularization_losses
	keras_api
7__call__
*8&call_and_return_all_conditional_losses"
_tf_keras_layer
?

kernel
bias
	variables
trainable_variables
regularization_losses
	keras_api
9__call__
*:&call_and_return_all_conditional_losses"
_tf_keras_layer
w
iter

beta_1

beta_2
	decay
learning_ratem0m1v2v3"
	optimizer
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
?
	variables

layers
layer_regularization_losses
non_trainable_variables
layer_metrics
 metrics
	trainable_variables

regularization_losses
4__call__
5_default_save_signature
*6&call_and_return_all_conditional_losses
&6"call_and_return_conditional_losses"
_generic_user_object
,
;serving_default"
signature_map
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
	variables

!layers
"layer_regularization_losses
#non_trainable_variables
$layer_metrics
%metrics
trainable_variables
regularization_losses
7__call__
*8&call_and_return_all_conditional_losses
&8"call_and_return_conditional_losses"
_generic_user_object
:2level/kernel
:2
level/bias
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
?
	variables

&layers
'layer_regularization_losses
(non_trainable_variables
)layer_metrics
*metrics
trainable_variables
regularization_losses
9__call__
*:&call_and_return_all_conditional_losses
&:"call_and_return_conditional_losses"
_generic_user_object
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
J
0
1
2
3
4
5"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
'
+0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
N
	,total
	-count
.	variables
/	keras_api"
_tf_keras_metric
:  (2total
:  (2count
.
,0
-1"
trackable_list_wrapper
-
.	variables"
_generic_user_object
#:!2Adam/level/kernel/m
:2Adam/level/bias/m
#:!2Adam/level/kernel/v
:2Adam/level/bias/v
?2?
)__inference_model_layer_call_fn_119416802
)__inference_model_layer_call_fn_119416928
)__inference_model_layer_call_fn_119416940
)__inference_model_layer_call_fn_119416870?
???
FullArgSpec1
args)?&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults?
p 

 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?B?
$__inference__wrapped_model_119416754powertempcpu_idlefan_rpm"?
???
FullArgSpec
args? 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
D__inference_model_layer_call_and_return_conditional_losses_119416955
D__inference_model_layer_call_and_return_conditional_losses_119416970
D__inference_model_layer_call_and_return_conditional_losses_119416883
D__inference_model_layer_call_and_return_conditional_losses_119416896?
???
FullArgSpec1
args)?&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults?
p 

 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
/__inference_concatenate_layer_call_fn_119416978?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
J__inference_concatenate_layer_call_and_return_conditional_losses_119416987?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
)__inference_level_layer_call_fn_119416996?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
D__inference_level_layer_call_and_return_conditional_losses_119417006?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?B?
'__inference_signature_wrapper_119416916cpu_idlefan_rpmpowertemp"?
???
FullArgSpec
args? 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 ?
$__inference__wrapped_model_119416754????
???
???
?
power?????????
?
temp?????????

"?
cpu_idle?????????
!?
fan_rpm?????????
? "-?*
(
level?
level??????????
J__inference_concatenate_layer_call_and_return_conditional_losses_119416987????
???
???
"?
inputs/0?????????
"?
inputs/1?????????

"?
inputs/2?????????
"?
inputs/3?????????
? "%?"
?
0?????????
? ?
/__inference_concatenate_layer_call_fn_119416978????
???
???
"?
inputs/0?????????
"?
inputs/1?????????

"?
inputs/2?????????
"?
inputs/3?????????
? "???????????
D__inference_level_layer_call_and_return_conditional_losses_119417006\/?,
%?"
 ?
inputs?????????
? "%?"
?
0?????????
? |
)__inference_level_layer_call_fn_119416996O/?,
%?"
 ?
inputs?????????
? "???????????
D__inference_model_layer_call_and_return_conditional_losses_119416883????
???
???
?
power?????????
?
temp?????????

"?
cpu_idle?????????
!?
fan_rpm?????????
p 

 
? "%?"
?
0?????????
? ?
D__inference_model_layer_call_and_return_conditional_losses_119416896????
???
???
?
power?????????
?
temp?????????

"?
cpu_idle?????????
!?
fan_rpm?????????
p

 
? "%?"
?
0?????????
? ?
D__inference_model_layer_call_and_return_conditional_losses_119416955????
???
???
"?
inputs/0?????????
"?
inputs/1?????????

"?
inputs/2?????????
"?
inputs/3?????????
p 

 
? "%?"
?
0?????????
? ?
D__inference_model_layer_call_and_return_conditional_losses_119416970????
???
???
"?
inputs/0?????????
"?
inputs/1?????????

"?
inputs/2?????????
"?
inputs/3?????????
p

 
? "%?"
?
0?????????
? ?
)__inference_model_layer_call_fn_119416802????
???
???
?
power?????????
?
temp?????????

"?
cpu_idle?????????
!?
fan_rpm?????????
p 

 
? "???????????
)__inference_model_layer_call_fn_119416870????
???
???
?
power?????????
?
temp?????????

"?
cpu_idle?????????
!?
fan_rpm?????????
p

 
? "???????????
)__inference_model_layer_call_fn_119416928????
???
???
"?
inputs/0?????????
"?
inputs/1?????????

"?
inputs/2?????????
"?
inputs/3?????????
p 

 
? "???????????
)__inference_model_layer_call_fn_119416940????
???
???
"?
inputs/0?????????
"?
inputs/1?????????

"?
inputs/2?????????
"?
inputs/3?????????
p

 
? "???????????
'__inference_signature_wrapper_119416916????
? 
???
.
cpu_idle"?
cpu_idle?????????
,
fan_rpm!?
fan_rpm?????????
(
power?
power?????????
&
temp?
temp?????????
"-?*
(
level?
level?????????