Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C33842DA5F
	for <lists+kernel-janitors@lfdr.de>; Wed, 29 May 2019 12:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbfE2KXQ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 29 May 2019 06:23:16 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:48546 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbfE2KXP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 29 May 2019 06:23:15 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4TADxHl010616;
        Wed, 29 May 2019 10:23:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=YSX4soczZU8acP0Y1KOfTFMHboxo2+ZXjqe+IMkap6k=;
 b=zQdCgbq4yv/VvoGvUpN36YOPlasi548eZ2Je99x+WhmAl7+Dt0COzUpzQXHwW+GA4ABT
 NJiSuVO0JEidgP4qk/LCsvBTQnUIShDULziHHYZlCB5Vufn0vO9GHXqwmqOwfAV1Mkmk
 w5ejERUCfzV3V0j1iWvGjItoK8yYJwqsPjHopV0YXGimD4aAODqOtcnlKfLbxnZakFSk
 h3Rk5c+K4Cq33BlylKhbTPL0NVbgf8QrLMl0J53G1BRKXIV5LbMtyCsJ7R2balNp/R3J
 Ov8chfRBtGcbdn6pVbvH3bN8xH02l7RgnxlgMwsA5JXi2vaTaOz8Irj1vUYF4jaBeJqT 7w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 2spu7dgxsr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 29 May 2019 10:23:13 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4TALLMs025809;
        Wed, 29 May 2019 10:23:12 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 2ss1fncf3a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 29 May 2019 10:23:12 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4TANB9S007138;
        Wed, 29 May 2019 10:23:11 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 29 May 2019 03:23:11 -0700
Date:   Wed, 29 May 2019 13:23:05 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     michal.kalderon@marvell.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] qed: Add llh ppfid interface and 100g support for
 offload protocols
Message-ID: <20190529102305.GA13975@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9271 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=966
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905290069
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9271 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=995 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905290069
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Michal Kalderon,

The patch 79284adeb99e: "qed: Add llh ppfid interface and 100g
support for offload protocols" from May 26, 2019, leads to the
following static checker warning:

	drivers/net/ethernet/qlogic/qed/qed_dev.c:1014 qed_llh_add_mac_filter()
	error: uninitialized symbol 'abs_ppfid'.

drivers/net/ethernet/qlogic/qed/qed_dev.c
   976  int qed_llh_add_mac_filter(struct qed_dev *cdev,
   977                             u8 ppfid, u8 mac_addr[ETH_ALEN])
   978  {
   979          struct qed_hwfn *p_hwfn = QED_LEADING_HWFN(cdev);
   980          struct qed_ptt *p_ptt = qed_ptt_acquire(p_hwfn);
   981          union qed_llh_filter filter = {};
   982          u8 filter_idx, abs_ppfid;
                               ^^^^^^^^^

   983          u32 high, low, ref_cnt;
   984          int rc = 0;
   985  
   986          if (!p_ptt)
   987                  return -EAGAIN;
   988  
   989          if (!test_bit(QED_MF_LLH_MAC_CLSS, &cdev->mf_bits))
   990                  goto out;
   991  
   992          memcpy(filter.mac.addr, mac_addr, ETH_ALEN);
   993          rc = qed_llh_shadow_add_filter(cdev, ppfid,
   994                                         QED_LLH_FILTER_TYPE_MAC,
   995                                         &filter, &filter_idx, &ref_cnt);
   996          if (rc)
   997                  goto err;
   998  
   999          /* Configure the LLH only in case of a new the filter */
  1000          if (ref_cnt == 1) {
                    ^^^^^^^^^^^^
Assume != 1

  1001                  rc = qed_llh_abs_ppfid(cdev, ppfid, &abs_ppfid);
  1002                  if (rc)
  1003                          goto err;
  1004  
  1005                  high = mac_addr[1] | (mac_addr[0] << 8);
  1006                  low = mac_addr[5] | (mac_addr[4] << 8) | (mac_addr[3] << 16) |
  1007                        (mac_addr[2] << 24);
  1008                  rc = qed_llh_add_filter(p_hwfn, p_ptt, abs_ppfid, filter_idx,
  1009                                          0, high, low);
  1010                  if (rc)
  1011                          goto err;
  1012          }
  1013  
  1014          DP_VERBOSE(cdev,
  1015                     QED_MSG_SP,
  1016                     "LLH: Added MAC filter [%pM] to ppfid %hhd [abs %hhd] at idx %hhd [ref_cnt %d]\n",
  1017                     mac_addr, ppfid, abs_ppfid, filter_idx, ref_cnt);
                                            ^^^^^^^^^
See also:
drivers/net/ethernet/qlogic/qed/qed_dev.c:1160 qed_llh_add_protocol_filter() error: uninitialized symbol 'abs_ppfid'.
drivers/net/ethernet/qlogic/qed/qed_dev.c:1210 qed_llh_remove_mac_filter() error: uninitialized symbol 'abs_ppfid'.
drivers/net/ethernet/qlogic/qed/qed_dev.c:1268 qed_llh_remove_protocol_filter() error: uninitialized symbol 'abs_ppfid'.

regards,
dan carpenter
