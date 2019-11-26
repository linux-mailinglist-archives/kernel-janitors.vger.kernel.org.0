Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 154F4109DCE
	for <lists+kernel-janitors@lfdr.de>; Tue, 26 Nov 2019 13:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbfKZMV5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 26 Nov 2019 07:21:57 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:45530 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727733AbfKZMV5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 Nov 2019 07:21:57 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQCKGUB121386;
        Tue, 26 Nov 2019 12:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=NX/qAWATpxc01nwpIXpPdy4VLewHmK8V3ZS9HfGA/Q8=;
 b=Y2oQm8/afiVO9P6T6FZi895INpqpsvPFEdSyE0uWDZDmhWRly65zZPfkS+2BaRQ2j+7q
 OFh9j9LGovTZumbywJaLreqw2YFbxNysOol38lt/Bb59SXWP/pPmkUJ1QxQqKnBNQjmi
 81EUMvU3ZL/d16CAzx+vqBaxsmd0EYY85nS9XkclFgaAIX430ziB+u2dh/frjPqYXBSh
 YkFAt+36r/EXl8swnDzXaaepOGMPRgga/ZQbh2DoQyqQ79JimNzurB55Rrw12A1scMsg
 BPu+dpY03EadmXQwpN32utqW6BYWnjs+4+CzoBOPRyAaxQU4uJlW/0Kw9DhB0rDt1k17 zA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 2wevqq6f8d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Nov 2019 12:21:54 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQC8kLX033492;
        Tue, 26 Nov 2019 12:21:53 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 2wgvh9wkug-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Nov 2019 12:21:53 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xAQCLpub007324;
        Tue, 26 Nov 2019 12:21:52 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 26 Nov 2019 04:21:51 -0800
Date:   Tue, 26 Nov 2019 15:21:44 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     vasundhara-v.volam@broadcom.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] bnxt_en: Report health status update after reset is done
Message-ID: <20191126122144.qzyppfh4pjr7gib7@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=735
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911260110
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=795 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911260110
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Vasundhara Volam,

This is a semi-automatic email about new static checker warnings.

The patch e4e38237d7e3: "bnxt_en: Report health status update after
reset is done" from Nov 18, 2019, leads to the following Smatch
complaint:

    drivers/net/ethernet/broadcom/bnxt/bnxt.c:10804 bnxt_fw_reset_task()
     error: we previously assumed 'bp->fw_health' could be null (see line 10755)

drivers/net/ethernet/broadcom/bnxt/bnxt.c
 10754			if (test_bit(BNXT_STATE_FW_FATAL_COND, &bp->state) &&
 10755			    bp->fw_health) {
                            ^^^^^^^^^^^^^
It looks like ->fw_health can be NULL.

 10756				u32 val;
 10757	
 10758				val = bnxt_fw_health_readl(bp,
 10759							   BNXT_FW_RESET_INPROG_REG);
 10760				if (val)
 10761					netdev_warn(bp->dev, "FW reset inprog %x after min wait time.\n",
 10762						    val);
 10763			}
 10764			clear_bit(BNXT_STATE_FW_FATAL_COND, &bp->state);
 10765			if (pci_enable_device(bp->pdev)) {
 10766				netdev_err(bp->dev, "Cannot re-enable PCI device\n");
 10767				goto fw_reset_abort;
 10768			}
 10769			pci_set_master(bp->pdev);
 10770			bp->fw_reset_state = BNXT_FW_RESET_STATE_POLL_FW;
 10771			/* fall through */
 10772		case BNXT_FW_RESET_STATE_POLL_FW:
 10773			bp->hwrm_cmd_timeout = SHORT_HWRM_CMD_TIMEOUT;
 10774			rc = __bnxt_hwrm_ver_get(bp, true);
 10775			if (rc) {
 10776				if (time_after(jiffies, bp->fw_reset_timestamp +
 10777					       (bp->fw_reset_max_dsecs * HZ / 10))) {
 10778					netdev_err(bp->dev, "Firmware reset aborted\n");
 10779					goto fw_reset_abort;
 10780				}
 10781				bnxt_queue_fw_reset_work(bp, HZ / 5);
 10782				return;
 10783			}
 10784			bp->hwrm_cmd_timeout = DFLT_HWRM_CMD_TIMEOUT;
 10785			bp->fw_reset_state = BNXT_FW_RESET_STATE_OPENING;
 10786			/* fall through */
 10787		case BNXT_FW_RESET_STATE_OPENING:
 10788			while (!rtnl_trylock()) {
 10789				bnxt_queue_fw_reset_work(bp, HZ / 10);
 10790				return;
 10791			}
 10792			rc = bnxt_open(bp->dev);
 10793			if (rc) {
 10794				netdev_err(bp->dev, "bnxt_open_nic() failed\n");
 10795				clear_bit(BNXT_STATE_IN_FW_RESET, &bp->state);
 10796				dev_close(bp->dev);
 10797			}
 10798	
 10799			bp->fw_reset_state = 0;
 10800			/* Make sure fw_reset_state is 0 before clearing the flag */
 10801			smp_mb__before_atomic();
 10802			clear_bit(BNXT_STATE_IN_FW_RESET, &bp->state);
 10803			bnxt_ulp_start(bp, rc);
 10804			bnxt_dl_health_status_update(bp, true);
                                                     ^^
But this patch adds a new unchecked dereference inside the function.

 10805			rtnl_unlock();
 10806			break;

regards,
dan carpenter
