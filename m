Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0E4D318BDF
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Feb 2021 14:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231843AbhBKNU0 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 11 Feb 2021 08:20:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50816 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231967AbhBKNSE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Feb 2021 08:18:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613049397;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=nwfCo96+ORexE4nd9lMvPQewHMvozTYtZvmFeVr87HA=;
        b=YvFmMbVxWDy/J391shCaeNT4jFiV3TJLfxnt4xSsoEvHA3lPgg/rvGA+wAm+avb4IrN8fY
        Hc+Y3MR+O1zSYZ4wTJQNBmC6aWBixiwdqnrLyVTHjSw26IfOLkspc7mQ/dGuivzPU0dkEz
        EtCKJwAFTORYqAqTCd1d+voS00i2Lrs=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-GrMAUBPeM46r70i4QH8cig-1; Thu, 11 Feb 2021 08:16:35 -0500
X-MC-Unique: GrMAUBPeM46r70i4QH8cig-1
Received: by mail-pj1-f72.google.com with SMTP id fv24so3689746pjb.9
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Feb 2021 05:16:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=nwfCo96+ORexE4nd9lMvPQewHMvozTYtZvmFeVr87HA=;
        b=aZPZYd3ycn3Opq6wUFzC/iwm7rKEh4t5uzQxBBkQAl0A409bxR/+gaaTBeLMM8c9MQ
         CnoA/ugrwneszSuQm9uuoyB2bji7LM/JYITEWkQNrtJX8hu4CQxnJM5BdoL9ruZD43zh
         Fg9DBkH58/YRrxH16Qb72xQ5w71mp6gzl+83vYoUEJj+NKqPcyhMh5SQ4xnXb9eyNqZQ
         ZU72ouRw091QAOcyHghYIjY221NYA5CJuid66xsAJoE1epCr8IPpxcnCWNK7Bwup3xkd
         006E17yZxwkVZPeX/++LTPmpNfjQkdASvUnDX7GR37dpRrPFimcv+vYz1nhLNL+SbU35
         wx/w==
X-Gm-Message-State: AOAM532HDWymCLTQrDahTEwU2bfG8AXCriuc6mN1kyfsjdwYsFB52LkI
        uBZWFzGRv0iCoBHhyWUxoSKYgh1ltra4qMqpM83yCFuuKCiVL8WFSfRi4C8oDybhzhDiiDQlcTR
        s/X1d/L1jHVXr2bimb/buRB7Citv9tkR0edSdyC1YfFzPV7rWq0JdkS8xs53xxwzeRi/j2d5yj1
        V4VVc=
X-Received: by 2002:a17:902:c40d:b029:e2:c0c3:75c9 with SMTP id k13-20020a170902c40db02900e2c0c375c9mr7474936plk.46.1613049394114;
        Thu, 11 Feb 2021 05:16:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVYC6+/htvGDWMyYQ1cg/ylcBsfp+7V0HdpzAXf+akRe5Ur0ljggfKQPKYsXUav1Nw8wDxKg==
X-Received: by 2002:a17:902:c40d:b029:e2:c0c3:75c9 with SMTP id k13-20020a170902c40db02900e2c0c375c9mr7474893plk.46.1613049393625;
        Thu, 11 Feb 2021 05:16:33 -0800 (PST)
Received: from machine1 ([171.50.216.159])
        by smtp.gmail.com with ESMTPSA id j185sm6207342pge.46.2021.02.11.05.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 05:16:33 -0800 (PST)
Date:   Thu, 11 Feb 2021 18:46:28 +0530
From:   "Milan P. Gandhi" <mgandhi@redhat.com>
To:     kernel-janitors@vger.kernel.org
Cc:     GR-QLogic-Storage-Upstream@marvell.com, linux-scsi@vger.kernel.org,
        njavali@marvell.com, jejb@linux.ibm.com, martin.petersen@oracle.com
Subject: [PATCH v2] scsi: qla2xxx: Removed extra space in variable
 declaration.
Message-ID: <20210211131628.GA10754@machine1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Removed extra space in variable declaration in qla2x00_sysfs_write_nvram

Signed-off-by: Milan P. Gandhi <mgandhi@redhat.com>
---
changes v2:
 - Added a small note about change.
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

