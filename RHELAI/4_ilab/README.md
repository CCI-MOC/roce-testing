## Distributed training using Instructlab*

`Instructlab is being restructured and tests will be rerun when complete`

Command:
```bash
ilab model train   --distributed-backend <fsdp/deepspeed> --pipeline accelerated --device cuda --data-path <path/to/jsonl> --rdzv-endpoint "$MASTER_ADDR:$MASTER_PORT" --nnodes 2 --node-rank 0 --gpus 2 --model-path <path/to/granite-7b-lab> --checkpoint-at-epoch
```

### Epoch Time per Iteration (seconds/it) - Measured at Rank 0  

| Epoch | w/ RoCE (FSDP) | w/ RoCE (DeepSpeed) | w/o RoCE (FSDP) |
|-------|--------------|-----------------|----------------|
| 1     | 19.57       | 14.83           | 47.59          |
| 2     | 19.59       | 17.01           |                |
| 3     | 19.53       | 17.12           |                |
| 4     | 19.54       | 17.01           |                |
| 5     | 19.65       | 17.01           |                |



