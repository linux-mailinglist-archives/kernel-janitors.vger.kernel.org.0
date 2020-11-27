Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03FF02C638B
	for <lists+kernel-janitors@lfdr.de>; Fri, 27 Nov 2020 12:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726471AbgK0LEG (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 27 Nov 2020 06:04:06 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:38106 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbgK0LED (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 27 Nov 2020 06:04:03 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ARAwprZ168771;
        Fri, 27 Nov 2020 11:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=K1Ef13sMb8jQdzGdJazAg7zKaeli8npahVrWjEHuV+4=;
 b=ECzFiSMLCS20cRBKyrtFAFJprsWSLWGUKf/+Yk/+2VP6wOK3s38PwmYuACJ2iCY8bHUT
 CFn5Oj0C/odJVb5oIxU3Rzzw/9QZJq+/zkECollOl//eDQqGJpdMFyjelu3yQQZohh8G
 jc0ZorKCcaP3lJdTMp3cmr9ygELOxwVnYrssW2DvI8ucUe3opWc5boImPXYp5BsiMSMj
 BtaOEUY5bZzJXc4jW+nXoQM9q53i8mWFAgtmqMW66NM9KmFdN/WodtWFEChStY9yO2op
 c2aTpQwXPhOaEwbjLpobpWD21naNgfRC79ToVL34R2NfYgw5DkQ+h+gVv2s19p6QDhP1 Cg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 351kwhs00d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 27 Nov 2020 11:04:00 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ARAxqBv030302;
        Fri, 27 Nov 2020 11:04:00 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 351kwge7ap-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 27 Nov 2020 11:04:00 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0ARB3xYK010252;
        Fri, 27 Nov 2020 11:03:59 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 27 Nov 2020 01:58:46 -0800
Date:   Fri, 27 Nov 2020 12:58:39 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     sbhatta@marvell.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] octeontx2-af: Add mbox messages to install and delete
 MCAM rules
Message-ID: <20201127095839.GA10400@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9817 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=3
 phishscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011270068
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9817 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=3
 bulkscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011270068
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Subbaraya Sundeep,

This is a semi-automatic email about new static checker warnings.

The patch 55307fcb9258: "octeontx2-af: Add mbox messages to install 
and delete MCAM rules" from Nov 15, 2020, leads to the following 
Smatch complaint:

    drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c:1001 npc_install_flow()
    error: we previously assumed 'def_ucast_rule' could be null (see line 975)

drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c
   974	
   975		if (def_ucast_rule)
                    ^^^^^^^^^^^^^^
This can be NULL

   976			missing_features = (def_ucast_rule->features ^ features) &
   977						def_ucast_rule->features;
   978	
   979		if (req->default_rule && req->append) {
   980			/* add to default rule */
   981			if (missing_features)
   982				npc_update_flow(rvu, entry, missing_features,
   983						&def_ucast_rule->packet,
   984						&def_ucast_rule->mask,
   985						&dummy, req->intf);
   986			enable = rvu_npc_write_default_rule(rvu, blkaddr,
   987							    nixlf, target,
   988							    pfvf->nix_rx_intf, entry,
   989							    &entry_index);
   990			installed_features = req->features | missing_features;
   991		} else if (req->default_rule && !req->append) {
   992			/* overwrite default rule */
   993			enable = rvu_npc_write_default_rule(rvu, blkaddr,
   994							    nixlf, target,
   995							    pfvf->nix_rx_intf, entry,
   996							    &entry_index);
   997		} else if (msg_from_vf) {
   998			/* normal rule - include default rule also to it for VF */
   999			npc_update_flow(rvu, entry, missing_features,
  1000					&def_ucast_rule->packet, &def_ucast_rule->mask,
                                        ^^^^^^^^^^^^^^^^^        ^^^^^^^^^^^^^^^
Unchecked dereferences.  The other paths check if "missing_features" is
true.

  1001					&dummy, req->intf);
  1002			installed_features = req->features | missing_features;
  1003		}

regards,
dan carpenter
