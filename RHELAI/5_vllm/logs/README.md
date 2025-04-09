## Log contents
Logs provide the following data:
- System Info (Relevant environment variables on the local and remote node, RHEL version, kernel version, `ilab system info` output, `ibv_devinfo -d $NCCL_IB_HCA` output, vLLM version)
- Python packages and version
- Commands executed on the local and remote machines for launching ray clusters
- Ray status
- vLLM serve command
- vLLM serve output
- Average performance metric (if no errors encountered during API server launch
- Request and reponse to the API server (optional)
  
## Log format
Log files being generated have the following naming format:

`model`\_`protocol`\_`tensor parallelism`\_`pipeline parallelism`\_`maxiumum sequence length`\_`maximum model length`\_\_\_\_`message`\_\_\_\_`timestamp`.log


- `model` : Short hand notation of the model - should at a minimum contain the model name and number of parameters.
- `protocol`: Protocol being used for inter-node communication (if required). The would be either `TCP` or `ROCE` depending on the value of the `NCCL_IB_DISABLE` flag.
- `tensor parallelism`: Typically the number of GPUs per node. Refer to the [vLLM documentation](https://docs.vllm.ai/en/latest/serving/distributed_serving.html#running-vllm-on-a-single-node) for more details.
- `pipeline parallelism`: Typically the number of nodes. Refer to the [vLLM documentation](https://docs.vllm.ai/en/latest/serving/distributed_serving.html#running-vllm-on-a-single-node) for more details.
- `maxiumum sequence length`: Either the `default` value, or a user specified one (typically if the full model context is too large to fit).
- `maximum model length`: Similar to sequence length above.
- `message`: Summary of the log's context.
- `timestamp`: Timestamp to track when the log was generated.
