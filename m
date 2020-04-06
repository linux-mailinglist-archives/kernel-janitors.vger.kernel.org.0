Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F94619F82E
	for <lists+kernel-janitors@lfdr.de>; Mon,  6 Apr 2020 16:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728739AbgDFOqG (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 6 Apr 2020 10:46:06 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:44204 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728697AbgDFOqF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 6 Apr 2020 10:46:05 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 036EhjjD194145;
        Mon, 6 Apr 2020 14:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=0/urMzieYB6xVEPP1/9NjMfGVTonzhWmU8N4mTK8r4E=;
 b=VsuJ/BerEoRejeWFtQrlmKFmvF/CUI1hoaqaitzBPxD6RHwLF7FBBc370Qrdqtg3VPHZ
 y6nt+BhDo7WwVFdU8SPHnZpdqoLm09QBg3UZ9AhMM5sEvJ2wBbom4TUI5zkzWTHeV60n
 3JKOKZE6teIsK4rAeJINKi9Z1JzY8u6PZCqbh6RwFNbO6oQs0JRAXDZHU9Fos67m5RG2
 kfA2AQrcDMf6NEcnKUB20tLBXPY2X1CuQHxnFN7GD15wBu0kZOhnv/nlMLw4HV5zAPIr
 DuGpfLTwvobodCUA7gvSEVkCQWa9nH48d8eMXYmalb1FXh4duXGWn00sy+ncMIDbbh7S Dg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 306j6m79bk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 06 Apr 2020 14:46:01 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 036EfO0B035064;
        Mon, 6 Apr 2020 14:46:01 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 30741arpw0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 06 Apr 2020 14:46:01 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 036Ejx2S028916;
        Mon, 6 Apr 2020 14:45:59 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 06 Apr 2020 07:45:59 -0700
Date:   Mon, 6 Apr 2020 17:45:52 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>
Cc:     virtualization@lists.linux-foundation.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 2/2] vdpa: Fix pointer math bug in vdpasim_get_config()
Message-ID: <20200406144552.GF68494@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200406144509.GE68494@mwanda>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9582 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004060122
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9582 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004060122
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If "offset" is non-zero then we end up copying from beyond the end of
the config because of pointer math.  We can fix this by casting the
struct to a u8 pointer.

Fixes: 2c53d0f64c06 ("vdpasim: vDPA device simulator")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Is it really worth letting people specify the offset?

 drivers/vdpa/vdpa_sim/vdpa_sim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index b3c800653056..e03c25765513 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -509,7 +509,7 @@ static void vdpasim_get_config(struct vdpa_device *vdpa, unsigned int offset,
 	struct vdpasim *vdpasim = vdpa_to_sim(vdpa);
 
 	if (offset + len < sizeof(struct virtio_net_config))
-		memcpy(buf, &vdpasim->config + offset, len);
+		memcpy(buf, (u8 *)&vdpasim->config + offset, len);
 }
 
 static void vdpasim_set_config(struct vdpa_device *vdpa, unsigned int offset,
-- 
2.25.1

