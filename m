Return-Path: <kernel-janitors+bounces-10068-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOrYJjyDe2mvFAIAu9opvQ
	(envelope-from <kernel-janitors+bounces-10068-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Thu, 29 Jan 2026 16:56:44 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18632B1B52
	for <lists+kernel-janitors@lfdr.de>; Thu, 29 Jan 2026 16:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 946BB304AD97
	for <lists+kernel-janitors@lfdr.de>; Thu, 29 Jan 2026 15:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285E63328E0;
	Thu, 29 Jan 2026 15:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FT7dzVsn"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804BA2765D4
	for <kernel-janitors@vger.kernel.org>; Thu, 29 Jan 2026 15:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702093; cv=none; b=W8THxjsBqp91JQJz/WdfF3Uq3Xk63FS5nY1bIx5wEAHct7g4ksHd3wQtLm/KGINKgIBl808rQKDV1MndCPPE0gOgngZOKy8QK93mtnf4HdPFviZ5din7oTwj4u73LUTytX8lyACO2NUK3ZPzbI1DOCCc09/8bBAlikpDy52ise0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702093; c=relaxed/simple;
	bh=Q4L9DM+YHHs0NooWoD0Qmd+HVUl64DDZt5vhvmO5zS8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TNotDTjtRBs0x2bdYEJhd0xq3GezR5aaawpoQ+8dt8x479UUWHu6gS2XjHL+crsU+U+59m50/iaKWK+qpiNB1Vl5xG6BnfWmGUiMidcNNwpf5tyLu1XF5A6adZ3cq42uoTY5dM+xlWmlTxpiIWt1MIggi2P/sk2lOD0HkKS9kR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FT7dzVsn; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso9918545e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 29 Jan 2026 07:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769702088; x=1770306888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rgSIXDM9Q8jFQpsfIVGKAZMTSqvcnmD4Z2E/dsepmqI=;
        b=FT7dzVsn/AAOHeaUC8tsHFnanWQTYd/29NKwgz4z42MmHqoHyQk4H/xW0jYK0zGHfS
         CmJm/JC2lE8qQMznjCdUCSHOsO9GscmCu48PkkmkTML7CpstX+IERMpKEpAB0eQ4NigO
         afMBjbw+GKbBMp4nQECEj5tzIBYBdAFgulkROmS9QHLWF76jSLK1eYC0FAPGy0IRJkMH
         VS6FYF79f1o2hZtIJWtvFHlXffvzCkeAET5EiQO/oTCcB8gXE5QxhwMXXOxLXSp72C+U
         OYVdu+OjwLT5wbDsm7rGbgzuQlv7JzSAbt9tEJ1u0b+UpNbw8mMkReZJ9Iuxiua7SXtl
         xdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769702088; x=1770306888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgSIXDM9Q8jFQpsfIVGKAZMTSqvcnmD4Z2E/dsepmqI=;
        b=SG9HKCtsWzLZMGOtiKDH6DghzRBeNy6U3CAJAM7RoL7x/8VXmzvxfmWvhL6818xZQR
         BZFyrLIowdfGYW7LgCGlAXBxm1p/hMijiEGgk87+GhagdNhsJ56nPWjqSuE5qGVurie0
         XHArh5mtnLM4Ugq2ctccwWJcYYbM//XKCAv6D2u1I9OvxeGfb5T1g6Zv0RJQfpcm7UB4
         Rr6LW58JorJLc0QE5p4F1VNU6hASrMV0qfxMASFu8dTMC5Gse5xUroh2ZevF0gFeii7c
         XmFZEiyLgjATcfGS7QKuxaEE5FWDw4Tk42KaM5dnVHc6t5cFvYyIigYoxhBOP6mblO4z
         luFQ==
X-Gm-Message-State: AOJu0YxMG9l8TnMKBn4f6gPj41iIULsV+R6gZ0K1aUXsKhb9h01H35Uq
	womfsRvlg1SeFtr0PFu9hOMPy4ZLk78SCnTHydivx7eeZgBTxlAbFTqK123uZsbe
X-Gm-Gg: AZuq6aL5O5cCnkx1QU8KKDntEiXSOc/5AqvaPJLkhJ8JZ5gS7ksrgqeCX3MEcpaaOZe
	KyzpzyH+w0zSSrt5TMdNEB0WQVoEyrPAFD1WQYMJcDBBrne5vCNrmDqAO1CeeuS+mEkwAjnmutT
	V623CxD9Rf70/8qDfDIQhS02G1HCPvbHc3W68gZj60AkKxPeiC+iKten+EQs9KOLLBCL/fmUbsu
	n8bqqP/Mi/gvbpCDwMZXPpoDwPCzw3wLTRUKxsk7e3g9DQeTljUiE3z6aB60j0ScqP1zMpOI+8j
	/HOlEy0iTtOuQuHorjjV66DbYXwOBgBzgxfGb4qnS0DQq21xuFS/8qeT9Lmh1OK4MB/xg48ymcA
	/8wrhYyFICu33y/81iUtbvK7T2sn/IsjukM0msqe7RQToCS4jFsgp3qMx91pbQYMczDA+5aeXFe
	pG4No3zuFNlw==
X-Received: by 2002:a05:600c:4ed0:b0:480:4a90:1b00 with SMTP id 5b1f17b1804b1-48069c69584mr113197125e9.20.1769702088044;
        Thu, 29 Jan 2026 07:54:48 -0800 (PST)
Received: from localhost ([87.254.0.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-481a5e18429sm6767465e9.16.2026.01.29.07.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 07:54:47 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Naresh Kumar Inna <naresh@chelsio.com>,
	linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scsi: csiostor: Fix dereference of null pointer rn
Date: Thu, 29 Jan 2026 15:53:32 +0000
Message-ID: <20260129155332.196338-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10068-lists,kernel-janitors=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[coliniking@gmail.com,kernel-janitors@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[kernel-janitors];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 18632B1B52
X-Rspamd-Action: no action

The error exit path when rn is NULL ends up deferencing the null
pointer rn via the use of the macro CSIO_INC_STATS. Fix this by
adding a new error return path label after the use of the macro
to avoid the deference.

Fixes: a3667aaed569 ("[SCSI] csiostor: Chelsio FCoE offload driver")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/scsi/csiostor/csio_scsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/csiostor/csio_scsi.c b/drivers/scsi/csiostor/csio_scsi.c
index c29bf2807e31..05137784f369 100644
--- a/drivers/scsi/csiostor/csio_scsi.c
+++ b/drivers/scsi/csiostor/csio_scsi.c
@@ -2074,7 +2074,7 @@ csio_eh_lun_reset_handler(struct scsi_cmnd *cmnd)
 	struct csio_scsi_level_data sld;
 
 	if (!rn)
-		goto fail;
+		goto fail_ret;
 
 	csio_dbg(hw, "Request to reset LUN:%llu (ssni:0x%x tgtid:%d)\n",
 		      cmnd->device->lun, rn->flowid, rn->scsi_id);
@@ -2220,6 +2220,7 @@ csio_eh_lun_reset_handler(struct scsi_cmnd *cmnd)
 	csio_put_scsi_ioreq_lock(hw, scsim, ioreq);
 fail:
 	CSIO_INC_STATS(rn, n_lun_rst_fail);
+fail_ret:
 	return FAILED;
 }
 
-- 
2.47.3


