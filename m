Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A00E63A4D53
	for <lists+kernel-janitors@lfdr.de>; Sat, 12 Jun 2021 09:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbhFLHUv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 12 Jun 2021 03:20:51 -0400
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:43054 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S230486AbhFLHUu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 12 Jun 2021 03:20:50 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d74 with ME
        id G7Jp2500D21Fzsu037Jq2t; Sat, 12 Jun 2021 09:18:50 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 12 Jun 2021 09:18:50 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     subbu.seetharaman@broadcom.com, ketan.mukadam@broadcom.com,
        jitendra.bhivare@broadcom.com, jejb@linux.ibm.com,
        martin.petersen@oracle.com, minhduc.tran@emulex.com,
        sony.john-n@emulex.com, JBottomley@Parallels.com,
        jayamohank@gmail.com
Cc:     linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] scsi: be2iscsi: Fix some missing space in some messages (+some extra style issues)
Date:   Sat, 12 Jun 2021 09:18:47 +0200
Message-Id: <8cb62f0eb96ec7ce7a73fe97cb4490dd5121ecff.1623482155.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <77adb02cfea7f1364e5603ecf3930d8597ae356e.1623482155.git.christophe.jaillet@wanadoo.fr>
References: <77adb02cfea7f1364e5603ecf3930d8597ae356e.1623482155.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Fix a few style issues reported by checkpatch.pl
  Avoid duplicated word in comment.
  Add missing space in messages.
  Unneeded continuation line character.
  Unneeded extra spaces.
  Unneeded log message after memory allocation failure.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This driver looks old, so fixing some style issue could be useless.
However, the ones fixed here look useful to me, either because it improves
the readability of log messages (missing spaces), reduce warnings
generated by some static checker (extra space/alignment issue) or removes
some weird style (continuation line)

Much more could be done, but many of the remaining style issues are related
to split messages, and such warnings are, IMHO, mostly useless to fix.

Feel free to ignore this patch :)
---
 drivers/scsi/be2iscsi/be_main.c | 102 ++++++++++++--------------------
 1 file changed, 38 insertions(+), 64 deletions(-)

diff --git a/drivers/scsi/be2iscsi/be_main.c b/drivers/scsi/be2iscsi/be_main.c
index b89a7db477c7..e70f69f791db 100644
--- a/drivers/scsi/be2iscsi/be_main.c
+++ b/drivers/scsi/be2iscsi/be_main.c
@@ -143,8 +143,7 @@ DEVICE_ATTR(beiscsi_##_name, S_IRUGO | S_IWUSR,\
 	      beiscsi_##_name##_disp, beiscsi_##_name##_store)
 
 /*
- * When new log level added update the
- * the MAX allowed value for log_enable
+ * When new log level added update MAX allowed value for log_enable
  */
 BEISCSI_RW_ATTR(log_enable, 0x00,
 		0xFF, 0x00, "Enable logging Bit Mask\n"
@@ -825,9 +824,8 @@ static int beiscsi_init_irqs(struct beiscsi_hba *phba)
 					  &phwi_context->be_eq[i]);
 			if (ret) {
 				beiscsi_log(phba, KERN_ERR, BEISCSI_LOG_INIT,
-					    "BM_%d : beiscsi_init_irqs-Failed to"
-					    "register msix for i = %d\n",
-					    i);
+					    "BM_%d : %s-Failed to register msix for i = %d\n",
+					    __func__, i);
 				kfree(phba->msi_name[i]);
 				goto free_msix_irqs;
 			}
@@ -841,9 +839,9 @@ static int beiscsi_init_irqs(struct beiscsi_hba *phba)
 		ret = request_irq(pci_irq_vector(pcidev, i), be_isr_mcc, 0,
 				  phba->msi_name[i], &phwi_context->be_eq[i]);
 		if (ret) {
-			beiscsi_log(phba, KERN_ERR, BEISCSI_LOG_INIT ,
-				    "BM_%d : beiscsi_init_irqs-"
-				    "Failed to register beiscsi_msix_mcc\n");
+			beiscsi_log(phba, KERN_ERR, BEISCSI_LOG_INIT,
+				    "BM_%d : %s-Failed to register beiscsi_msix_mcc\n",
+				    __func__);
 			kfree(phba->msi_name[i]);
 			goto free_msix_irqs;
 		}
@@ -853,8 +851,8 @@ static int beiscsi_init_irqs(struct beiscsi_hba *phba)
 				  "beiscsi", phba);
 		if (ret) {
 			beiscsi_log(phba, KERN_ERR, BEISCSI_LOG_INIT,
-				    "BM_%d : beiscsi_init_irqs-"
-				    "Failed to register irq\\n");
+				    "BM_%d : %s-Failed to register irq\n",
+				    __func__);
 			return ret;
 		}
 	}
@@ -1030,7 +1028,7 @@ free_wrb_handle(struct beiscsi_hba *phba, struct hwi_wrb_context *pwrb_context,
 			       phba->params.wrbs_per_cxn);
 	beiscsi_log(phba, KERN_INFO,
 		    BEISCSI_LOG_IO | BEISCSI_LOG_CONFIG,
-		    "BM_%d : FREE WRB: pwrb_handle=%p free_index=0x%x"
+		    "BM_%d : FREE WRB: pwrb_handle=%p free_index=0x%x "
 		    "wrb_handles_available=%d\n",
 		    pwrb_handle, pwrb_context->free_index,
 		    pwrb_context->wrb_handles_available);
@@ -1374,7 +1372,7 @@ static void hwi_complete_cmd(struct beiscsi_conn *beiscsi_conn,
 		beiscsi_log(phba, KERN_ERR,
 			    BEISCSI_LOG_CONFIG | BEISCSI_LOG_IO,
 			    "BM_%d :\t\t No HWH_TYPE_LOGIN Expected in"
-			    " hwi_complete_cmd- Solicited path\n");
+			    " %s- Solicited path\n", __func__);
 		break;
 
 	case HWH_TYPE_NOP:
@@ -1384,8 +1382,8 @@ static void hwi_complete_cmd(struct beiscsi_conn *beiscsi_conn,
 	default:
 		beiscsi_log(phba, KERN_WARNING,
 			    BEISCSI_LOG_CONFIG | BEISCSI_LOG_IO,
-			    "BM_%d : In hwi_complete_cmd, unknown type = %d"
-			    "wrb_index 0x%x CID 0x%x\n", type,
+			    "BM_%d : In %s, unknown type = %d "
+			    "wrb_index 0x%x CID 0x%x\n", __func__, type,
 			    csol_cqe.wrb_index,
 			    csol_cqe.cid);
 		break;
@@ -1883,9 +1881,9 @@ unsigned int beiscsi_process_cq(struct be_eq_obj *pbe_eq, int budget)
 				cid = AMAP_GET_BITS(
 						    struct amap_i_t_dpdu_cqe_v2,
 						    cid, sol);
-			 else
-				 cid = AMAP_GET_BITS(struct amap_sol_cqe_v2,
-						     cid, sol);
+			else
+				cid = AMAP_GET_BITS(struct amap_sol_cqe_v2,
+						    cid, sol);
 		}
 
 		cri_index = BE_GET_CRI_FROM_CID(cid);
@@ -2010,8 +2008,7 @@ unsigned int beiscsi_process_cq(struct be_eq_obj *pbe_eq, int budget)
 		default:
 			beiscsi_log(phba, KERN_ERR,
 				    BEISCSI_LOG_IO | BEISCSI_LOG_CONFIG,
-				    "BM_%d : Invalid CQE Event Received Code : %d"
-				    "CID 0x%x...\n",
+				    "BM_%d : Invalid CQE Event Received Code : %d CID 0x%x...\n",
 				    code, cid);
 			break;
 		}
@@ -3001,7 +2998,7 @@ static int beiscsi_create_eqs(struct beiscsi_hba *phba,
 	void *eq_vaddress;
 	dma_addr_t paddr;
 
-	num_eq_pages = PAGES_REQUIRED(phba->params.num_eq_entries * \
+	num_eq_pages = PAGES_REQUIRED(phba->params.num_eq_entries *
 				      sizeof(struct be_eq_entry));
 
 	if (phba->pcidev->msix_enabled)
@@ -3034,8 +3031,7 @@ static int beiscsi_create_eqs(struct beiscsi_hba *phba,
 					    BEISCSI_EQ_DELAY_DEF);
 		if (ret) {
 			beiscsi_log(phba, KERN_ERR, BEISCSI_LOG_INIT,
-				    "BM_%d : beiscsi_cmd_eq_create"
-				    "Failed for EQ\n");
+				    "BM_%d : beiscsi_cmd_eq_create Failed for EQ\n");
 			goto create_eq_error;
 		}
 
@@ -3068,7 +3064,7 @@ static int beiscsi_create_cqs(struct beiscsi_hba *phba,
 	int ret = -ENOMEM;
 	dma_addr_t paddr;
 
-	num_cq_pages = PAGES_REQUIRED(phba->params.num_cq_entries * \
+	num_cq_pages = PAGES_REQUIRED(phba->params.num_cq_entries *
 				      sizeof(struct sol_cqe));
 
 	for (i = 0; i < phba->num_cpus; i++) {
@@ -3090,8 +3086,7 @@ static int beiscsi_create_cqs(struct beiscsi_hba *phba,
 				    sizeof(struct sol_cqe), cq_vaddress);
 		if (ret) {
 			beiscsi_log(phba, KERN_ERR, BEISCSI_LOG_INIT,
-				    "BM_%d : be_fill_queue Failed "
-				    "for ISCSI CQ\n");
+				    "BM_%d : be_fill_queue Failed for ISCSI CQ\n");
 			goto create_cq_error;
 		}
 
@@ -3100,8 +3095,7 @@ static int beiscsi_create_cqs(struct beiscsi_hba *phba,
 					    false, 0);
 		if (ret) {
 			beiscsi_log(phba, KERN_ERR, BEISCSI_LOG_INIT,
-				    "BM_%d : beiscsi_cmd_eq_create"
-				    "Failed for ISCSI CQ\n");
+				    "BM_%d : beiscsi_cmd_eq_create Failed for ISCSI CQ\n");
 			goto create_cq_error;
 		}
 		beiscsi_log(phba, KERN_INFO, BEISCSI_LOG_INIT,
@@ -3226,8 +3220,8 @@ beiscsi_create_def_data(struct beiscsi_hba *phba,
 		    phwi_context->be_def_dataq[ulp_num].id);
 
 	beiscsi_log(phba, KERN_INFO, BEISCSI_LOG_INIT,
-		    "BM_%d : DEFAULT PDU DATA RING CREATED"
-		    "on ULP : %d\n", ulp_num);
+		    "BM_%d : DEFAULT PDU DATA RING CREATED on ULP : %d\n",
+		    ulp_num);
 	return 0;
 }
 
@@ -3253,13 +3247,13 @@ beiscsi_post_template_hdr(struct beiscsi_hba *phba)
 
 			if (status != 0) {
 				beiscsi_log(phba, KERN_ERR, BEISCSI_LOG_INIT,
-					    "BM_%d : Post Template HDR Failed for"
+					    "BM_%d : Post Template HDR Failed for "
 					    "ULP_%d\n", ulp_num);
 				return status;
 			}
 
 			beiscsi_log(phba, KERN_INFO, BEISCSI_LOG_INIT,
-				    "BM_%d : Template HDR Pages Posted for"
+				    "BM_%d : Template HDR Pages Posted for "
 				    "ULP_%d\n", ulp_num);
 		}
 	}
@@ -3374,18 +3368,17 @@ beiscsi_create_wrb_rings(struct beiscsi_hba *phba,
 		} else {
 			idx++;
 			wrb_vaddr = mem_descr->mem_array[idx].virtual_address;
-			pa_addr_lo = mem_descr->mem_array[idx].\
+			pa_addr_lo = mem_descr->mem_array[idx].
 					bus_address.u.a64.address;
 			num_wrb_rings = mem_descr->mem_array[idx].size /
 					(phba->params.wrbs_per_cxn *
 					sizeof(struct iscsi_wrb));
 			pwrb_arr[num].virtual_address = wrb_vaddr;
-			pwrb_arr[num].bus_address.u.a64.address\
-						= pa_addr_lo;
+			pwrb_arr[num].bus_address.u.a64.address = pa_addr_lo;
 			pwrb_arr[num].size = phba->params.wrbs_per_cxn *
 						 sizeof(struct iscsi_wrb);
 			wrb_vaddr += pwrb_arr[num].size;
-			pa_addr_lo   += pwrb_arr[num].size;
+			pa_addr_lo += pwrb_arr[num].size;
 			num_wrb_rings--;
 		}
 	}
@@ -3937,7 +3930,7 @@ static int beiscsi_init_sgl_handle(struct beiscsi_hba *phba)
 		idx++;
 	}
 	beiscsi_log(phba, KERN_INFO, BEISCSI_LOG_INIT,
-		    "BM_%d : phba->io_sgl_hndl_avbl=%d"
+		    "BM_%d : phba->io_sgl_hndl_avbl=%d "
 		    "phba->eh_sgl_hndl_avbl=%d\n",
 		    phba->io_sgl_hndl_avbl,
 		    phba->eh_sgl_hndl_avbl);
@@ -3995,13 +3988,8 @@ static int hba_setup_cid_tbls(struct beiscsi_hba *phba)
 					       GFP_KERNEL);
 
 			if (!ptr_cid_info) {
-				beiscsi_log(phba, KERN_ERR, BEISCSI_LOG_INIT,
-					    "BM_%d : Failed to allocate memory"
-					    "for ULP_CID_INFO for ULP : %d\n",
-					    ulp_num);
 				ret = -ENOMEM;
 				goto free_memory;
-
 			}
 
 			/* Allocate memory for CID array */
@@ -4010,10 +3998,6 @@ static int hba_setup_cid_tbls(struct beiscsi_hba *phba)
 					sizeof(*ptr_cid_info->cid_array),
 					GFP_KERNEL);
 			if (!ptr_cid_info->cid_array) {
-				beiscsi_log(phba, KERN_ERR, BEISCSI_LOG_INIT,
-					    "BM_%d : Failed to allocate memory"
-					    "for CID_ARRAY for ULP : %d\n",
-					    ulp_num);
 				kfree(ptr_cid_info);
 				ptr_cid_info = NULL;
 				ret = -ENOMEM;
@@ -4031,9 +4015,6 @@ static int hba_setup_cid_tbls(struct beiscsi_hba *phba)
 				 sizeof(struct iscsi_endpoint *),
 				 GFP_KERNEL);
 	if (!phba->ep_array) {
-		beiscsi_log(phba, KERN_ERR, BEISCSI_LOG_INIT,
-			    "BM_%d : Failed to allocate memory in "
-			    "hba_setup_cid_tbls\n");
 		ret = -ENOMEM;
 
 		goto free_memory;
@@ -4043,10 +4024,6 @@ static int hba_setup_cid_tbls(struct beiscsi_hba *phba)
 				   sizeof(struct beiscsi_conn *),
 				   GFP_KERNEL);
 	if (!phba->conn_table) {
-		beiscsi_log(phba, KERN_ERR, BEISCSI_LOG_INIT,
-			    "BM_%d : Failed to allocate memory in"
-			    "hba_setup_cid_tbls\n");
-
 		kfree(phba->ep_array);
 		phba->ep_array = NULL;
 		ret = -ENOMEM;
@@ -4399,7 +4376,7 @@ static int beiscsi_alloc_pdu(struct iscsi_task *task, uint8_t opcode)
 		if (!io_task->psgl_handle) {
 			beiscsi_log(phba, KERN_ERR,
 				    BEISCSI_LOG_IO | BEISCSI_LOG_CONFIG,
-				    "BM_%d : Alloc of IO_SGL_ICD Failed"
+				    "BM_%d : Alloc of IO_SGL_ICD Failed "
 				    "for the CID : %d\n",
 				    beiscsi_conn->beiscsi_conn_cid);
 			goto free_hndls;
@@ -4410,7 +4387,7 @@ static int beiscsi_alloc_pdu(struct iscsi_task *task, uint8_t opcode)
 		if (!io_task->pwrb_handle) {
 			beiscsi_log(phba, KERN_ERR,
 				    BEISCSI_LOG_IO | BEISCSI_LOG_CONFIG,
-				    "BM_%d : Alloc of WRB_HANDLE Failed"
+				    "BM_%d : Alloc of WRB_HANDLE Failed "
 				    "for the CID : %d\n",
 				    beiscsi_conn->beiscsi_conn_cid);
 			goto free_io_hndls;
@@ -4426,10 +4403,9 @@ static int beiscsi_alloc_pdu(struct iscsi_task *task, uint8_t opcode)
 					beiscsi_log(phba, KERN_ERR,
 						    BEISCSI_LOG_IO |
 						    BEISCSI_LOG_CONFIG,
-						    "BM_%d : Alloc of MGMT_SGL_ICD Failed"
+						    "BM_%d : Alloc of MGMT_SGL_ICD Failed "
 						    "for the CID : %d\n",
-						    beiscsi_conn->
-						    beiscsi_conn_cid);
+						    beiscsi_conn->beiscsi_conn_cid);
 					goto free_hndls;
 				}
 
@@ -4444,10 +4420,9 @@ static int beiscsi_alloc_pdu(struct iscsi_task *task, uint8_t opcode)
 					beiscsi_log(phba, KERN_ERR,
 						    BEISCSI_LOG_IO |
 						    BEISCSI_LOG_CONFIG,
-						    "BM_%d : Alloc of WRB_HANDLE Failed"
+						    "BM_%d : Alloc of WRB_HANDLE Failed "
 						    "for the CID : %d\n",
-						    beiscsi_conn->
-						    beiscsi_conn_cid);
+						    beiscsi_conn->beiscsi_conn_cid);
 					goto free_mgmt_hndls;
 				}
 				beiscsi_conn->plogin_wrb_handle =
@@ -4465,10 +4440,9 @@ static int beiscsi_alloc_pdu(struct iscsi_task *task, uint8_t opcode)
 				beiscsi_log(phba, KERN_ERR,
 					    BEISCSI_LOG_IO |
 					    BEISCSI_LOG_CONFIG,
-					    "BM_%d : Alloc of MGMT_SGL_ICD Failed"
+					    "BM_%d : Alloc of MGMT_SGL_ICD Failed "
 					    "for the CID : %d\n",
-					    beiscsi_conn->
-					    beiscsi_conn_cid);
+					    beiscsi_conn->beiscsi_conn_cid);
 				goto free_hndls;
 			}
 			io_task->pwrb_handle =
@@ -4478,7 +4452,7 @@ static int beiscsi_alloc_pdu(struct iscsi_task *task, uint8_t opcode)
 			if (!io_task->pwrb_handle) {
 				beiscsi_log(phba, KERN_ERR,
 					    BEISCSI_LOG_IO | BEISCSI_LOG_CONFIG,
-					    "BM_%d : Alloc of WRB_HANDLE Failed"
+					    "BM_%d : Alloc of WRB_HANDLE Failed "
 					    "for the CID : %d\n",
 					    beiscsi_conn->beiscsi_conn_cid);
 				goto free_mgmt_hndls;
-- 
2.30.2

