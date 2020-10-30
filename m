Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E099A2A0426
	for <lists+kernel-janitors@lfdr.de>; Fri, 30 Oct 2020 12:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgJ3Lan (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 30 Oct 2020 07:30:43 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:44296 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbgJ3Lam (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 30 Oct 2020 07:30:42 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09UBUOCF035863;
        Fri, 30 Oct 2020 11:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=aV8g3TvEmFnnzmfIl5CWD1pRb4VA5eMdzN83q1G7CPQ=;
 b=V3fRbTwY2QgdbvnoIMEG1oivCcvAZh0P5PSsl/HGJO0TpA1nSsbR6xdIoszn3wTdM+lB
 kebWOLya3dmDDQJblTRchu8gbnOCOqDbGTbmjmeBoRXR2l6tvvc9nOnasgOueyaEepu6
 9hM2sSP5LGLo+bOCYBf0PJGHJ+P9n3dAM8PTqInuodG3SKizTed9dITZtRfNmopCPvNj
 tN20LXiLebYDkLlSYFcvX/ucAaUFAtz87hRVgpbZuLzNT2DalzcB8ZZWxqKBKsjA4AZj
 yTRQ1/duXIhley1sZTwNHqJ+cOOLAnb1yerDm1JOGhwi8kl8i61QZi2FeMtxoV+wn2Fh KA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 34cc7m98de-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 30 Oct 2020 11:30:40 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09UBPTM3151140;
        Fri, 30 Oct 2020 11:30:39 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 34cx70kmpt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 30 Oct 2020 11:30:39 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09UBUdqo014008;
        Fri, 30 Oct 2020 11:30:39 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 30 Oct 2020 04:30:38 -0700
Date:   Fri, 30 Oct 2020 14:30:33 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     andraprs@amazon.com
Cc:     Alexandru Vasile <lexnv@amazon.com>,
        kernel-janitors@vger.kernel.org
Subject: [bug report] nitro_enclaves: Add logic for setting an enclave vCPU
Message-ID: <20201030113033.GA3251003@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9789 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=3
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010300088
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9789 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1011 mlxscore=0 suspectscore=3
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010300089
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Andra Paraschiv,

The patch ff8a4d3e3a99: "nitro_enclaves: Add logic for setting an
enclave vCPU" from Sep 21, 2020, leads to the following static
checker warning:

	drivers/virt/nitro_enclaves/ne_misc_dev.c:471 ne_donated_cpu()
	error: passing untrusted data 'cpu' to 'cpumask_test_cpu()'

drivers/virt/nitro_enclaves/ne_misc_dev.c
  1093          switch (cmd) {
  1094          case NE_ADD_VCPU: {
  1095                  int rc = -EINVAL;
  1096                  u32 vcpu_id = 0;
  1097  
  1098                  if (copy_from_user(&vcpu_id, (void __user *)arg, sizeof(vcpu_id)))
                                           ^^^^^^^^

  1099                          return -EFAULT;
  1100  
  1101                  mutex_lock(&ne_enclave->enclave_info_mutex);
  1102  
  1103                  if (ne_enclave->state != NE_STATE_INIT) {
  1104                          dev_err_ratelimited(ne_misc_dev.this_device,
  1105                                              "Enclave is not in init state\n");
  1106  
  1107                          mutex_unlock(&ne_enclave->enclave_info_mutex);
  1108  
  1109                          return -NE_ERR_NOT_IN_INIT_STATE;
  1110                  }
  1111  
  1112                  if (vcpu_id >= (ne_enclave->nr_parent_vm_cores *
  1113                      ne_enclave->nr_threads_per_core)) {

To prevent a buffer overflow vcpu_id has to be less than "nr_cpu_ids".
Is "ne_enclave->nr_parent_vm_cores * ne_enclave->nr_threads_per_core"
<= nr_cpu_ids?  If so then it's fine.

  1114                          dev_err_ratelimited(ne_misc_dev.this_device,
  1115                                              "vCPU id higher than max CPU id\n");
  1116  
  1117                          mutex_unlock(&ne_enclave->enclave_info_mutex);
  1118  
  1119                          return -NE_ERR_INVALID_VCPU;
  1120                  }
  1121  
  1122                  if (!vcpu_id) {
  1123                          /* Use the CPU pool for choosing a CPU for the enclave. */
  1124                          rc = ne_get_cpu_from_cpu_pool(ne_enclave, &vcpu_id);
  1125                          if (rc < 0) {
  1126                                  dev_err_ratelimited(ne_misc_dev.this_device,
  1127                                                      "Error in get CPU from pool [rc=%d]\n",
  1128                                                      rc);
  1129  
  1130                                  mutex_unlock(&ne_enclave->enclave_info_mutex);
  1131  
  1132                                  return rc;
  1133                          }
  1134                  } else {
  1135                          /* Check if the provided vCPU is available in the NE CPU pool. */
  1136                          rc = ne_check_cpu_in_cpu_pool(ne_enclave, vcpu_id);
                                                                          ^^^^^^^
This will lead to the out of bounds if vcpu_id is more than
nr_cpu_ids.

  1137                          if (rc < 0) {
  1138                                  dev_err_ratelimited(ne_misc_dev.this_device,

regards,
dan carpenter
