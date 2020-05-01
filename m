Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC5B1C1E11
	for <lists+kernel-janitors@lfdr.de>; Fri,  1 May 2020 21:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgEATv3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 1 May 2020 15:51:29 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:33710 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726377AbgEATv3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 1 May 2020 15:51:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588362688;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=s4R8huL+DY5qznfGLFwoyRq/hVfJS/ePnuccb29e8DE=;
        b=ewLdW4YvoFCEyVDxAQRKkqzeFeD4O60hLmtY8jtFr33cgkvKtm2Y3DqzZRI4Xq5Ut3GYK3
        j1zeyJOG0gM5QRZkBZX/I+O+H4OH4pzjEIIUOeQinM4n65LGxJqds0C9MhCbxHGMYq1jaZ
        Iss0kH7T+QEVANrNY6YP8gPtw3fjHUk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-C0KjUPd4Ov-HXGSeXKc19A-1; Fri, 01 May 2020 15:51:16 -0400
X-MC-Unique: C0KjUPd4Ov-HXGSeXKc19A-1
Received: by mail-wr1-f71.google.com with SMTP id f2so6174463wrm.9
        for <kernel-janitors@vger.kernel.org>; Fri, 01 May 2020 12:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s4R8huL+DY5qznfGLFwoyRq/hVfJS/ePnuccb29e8DE=;
        b=iyJeUgrfCSARBfK4fNKNVDEfuJI96jAUTGWd5GRBwVKkjAIPsjx53ZdAJMtuYY/Fti
         vwXuxQbBgr37DwsrgHRFLrOVfEcGuEzxP8jrHtmBfeL/KTGJvVjAT3gWhV67rtCapvuw
         d4ubOGKEZwzwhUq+Sn4ayLxZj7v+SU0M9dzxU0/NVy4HH4LWjg4M/Kotil8SWUBsNWGr
         1DuNynupoGlfrAW9MkhCu4Lqnk+URgD5Ww9kqi/0JbXZKE/Ky14NgYhxkorRAN5Cl3H/
         PWvy4xUEJX6pWA1H1btdyGR8JGJH2FxnUHON7fEM8ve6nFuTp8rVOLg9Z3bAPo8ZpCC9
         g1Fw==
X-Gm-Message-State: AGi0PuZ2Th+yUoy28jnFZtG5iPmN6GJcd+ZhTG/NDHpiFGpKcQNwWDZd
        gVI9OrLMfLI5lMiw9SUr6869d8IOfZraTm4T6rnbtEzqGZGRsikQGR31VFDvEle5MHphsnEGH4z
        K1Erm93R2mWyV3vjL75cwlgeyQjXh
X-Received: by 2002:a5d:4ac9:: with SMTP id y9mr6124287wrs.182.1588362674733;
        Fri, 01 May 2020 12:51:14 -0700 (PDT)
X-Google-Smtp-Source: APiQypIMCIpphYfLtabnfC9Vtc0kottgVu4tSaFbbsFwtCh4oI2U+BWXjlBIgI3gifvTl8FRreaGTQ==
X-Received: by 2002:a5d:4ac9:: with SMTP id y9mr6124263wrs.182.1588362674467;
        Fri, 01 May 2020 12:51:14 -0700 (PDT)
Received: from omos.redhat.com ([2a02:8308:b13f:2100:f695:3ae5:c8bf:2f57])
        by smtp.gmail.com with ESMTPSA id h137sm1034348wme.0.2020.05.01.12.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 12:51:13 -0700 (PDT)
From:   Ondrej Mosnacek <omosnace@redhat.com>
To:     selinux@vger.kernel.org, Paul Moore <paul@paul-moore.com>
Cc:     Wei Yongjun <weiyongjun1@huawei.com>,
        kernel-janitors@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] selinux: fix return value on error in policydb_read()
Date:   Fri,  1 May 2020 21:51:11 +0200
Message-Id: <20200501195111.3335258-1-omosnace@redhat.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The value of rc is still zero from the last assignment when the error
path is taken. Fix it by setting it to -ENOMEM before the
hashtab_create() call.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: e67b2ec9f617 ("selinux: store role transitions in a hash table")
Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 security/selinux/ss/policydb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
index 1c0041576643..9f7ce3e037d1 100644
--- a/security/selinux/ss/policydb.c
+++ b/security/selinux/ss/policydb.c
@@ -2540,6 +2540,7 @@ int policydb_read(struct policydb *p, void *fp)
 		goto bad;
 	nel = le32_to_cpu(buf[0]);
 
+	rc = -ENOMEM;
 	p->role_tr = hashtab_create(role_trans_hash, role_trans_cmp, nel);
 	if (!p->role_tr)
 		goto bad;
-- 
2.25.4

