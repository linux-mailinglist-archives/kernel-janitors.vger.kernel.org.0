Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D08E3318754
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Feb 2021 10:49:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhBKJrT (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 11 Feb 2021 04:47:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42035 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230108AbhBKJha (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Feb 2021 04:37:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613036162;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=yrH14ThSpslMqaxU9hfy00CpYCwozqauB+Xha4aC2vk=;
        b=FoRymX0tRzyHXp2+bOKNFF7/SiRusHkQtAf+I+nLtImZHBUwzNNv4SmDuMeJnIJ2EYa7Ud
        en4iFjCJ02B4hjy+8aJhPQVv09LkzjIQF6uer+xWVKK4vy1/CAlgqwkVfTgoz1CcWlAUfx
        6TGyIRrzz05XRJdlsnIzGBWSwzyKip4=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-_gw3MtGvMpiF4pBay9TSvA-1; Thu, 11 Feb 2021 04:36:01 -0500
X-MC-Unique: _gw3MtGvMpiF4pBay9TSvA-1
Received: by mail-pj1-f72.google.com with SMTP id l2so3422285pjy.4
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Feb 2021 01:36:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=yrH14ThSpslMqaxU9hfy00CpYCwozqauB+Xha4aC2vk=;
        b=sWAXuRGR4V64WV7AUpGbPCst2AvJ+DW/Zp0nOVbRD9nCsVJAyArIHJr5ydNRbcglKq
         w5J/M97VFwQrapRqHR6vEj8alRCcx+HLZ3438vJBiULKT5kxKsPUVkvmiBNL0h7jbnrG
         yyNj6IKEmDwiFgIcOfbciHYSQB6FCltofWpCIC3QGRU4p1oDBj9xc5CC3o4/jmUjFmRq
         MLriWpV+SE3wVcMmEcPeds0VKdPOG/bvuufWV/Tgy9egjslgefl/GfQYgO2C2LW0TQPm
         LVlSo4giBJFcmx2RS0wp7Aja/D7NBLogVAAfbe/jn065cW3rD+t1b1HsET4Wxkgv8OBw
         bhbQ==
X-Gm-Message-State: AOAM530m10nWPc9Z9HObX/R4RngTQMTtSKoCfLGo/RCPiYc1auzQbRAv
        4EQBbluwVDNJ0FE+pIdoRJ2+/dn25IhxkEWx21OAK67lvsauUtEze8pEw8cYj6nhmiWoay8XWFi
        pF0JrSSDhMO7IQ/0+hqFhP+dEDx4bZXSvc2/Y7Nz3MRhkZhqlbbaGoMNp56hlSCdleo585nFeC0
        OvoPE=
X-Received: by 2002:a17:90b:4a8c:: with SMTP id lp12mr3150915pjb.214.1613036159777;
        Thu, 11 Feb 2021 01:35:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzX5s6369kWgAFyoKTN1EnUhX28RncCcpO0G+q/leGwlQX5B7qbMMkpk7dNzP4jkl0D3uCh/A==
X-Received: by 2002:a17:90b:4a8c:: with SMTP id lp12mr3150881pjb.214.1613036159432;
        Thu, 11 Feb 2021 01:35:59 -0800 (PST)
Received: from machine1 ([171.50.216.159])
        by smtp.gmail.com with ESMTPSA id p12sm4469782pju.35.2021.02.11.01.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 01:35:58 -0800 (PST)
Date:   Thu, 11 Feb 2021 15:05:52 +0530
From:   "Milan P. Gandhi" <mgandhi@redhat.com>
To:     kernel-janitors@vger.kernel.org
Cc:     GR-QLogic-Storage-Upstream@marvell.com, linux-scsi@vger.kernel.org,
        njavali@marvell.com, jejb@linux.ibm.com, martin.petersen@oracle.com
Subject: [PATCH] scsi: qla2xxx: Removed extra space in variable declaration.
Message-ID: <20210211093552.GA5375@machine1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Signed-off-by: Milan P. Gandhi <mgandhi@redhat.com>
---
diff --git a/drivers/scsi/qla2xxx/qla_attr.c b/drivers/scsi/qla2xxx/qla_attr.c
index ab45ac1e5a72..7f2db8badb6d 100644
--- a/drivers/scsi/qla2xxx/qla_attr.c
+++ b/drivers/scsi/qla2xxx/qla_attr.c
@@ -226,7 +226,7 @@ qla2x00_sysfs_write_nvram(struct file *filp, struct kobject *kobj,
 	struct scsi_qla_host *vha = shost_priv(dev_to_shost(container_of(kobj,
 	    struct device, kobj)));
 	struct qla_hw_data *ha = vha->hw;
-	uint16_t	cnt;
+	uint16_t cnt;
 
 	if (!capable(CAP_SYS_ADMIN) || off != 0 || count != ha->nvram_size ||
 	    !ha->isp_ops->write_nvram)

