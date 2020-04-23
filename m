Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD9831B532D
	for <lists+kernel-janitors@lfdr.de>; Thu, 23 Apr 2020 05:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbgDWDb4 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 22 Apr 2020 23:31:56 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:40018 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726448AbgDWDb4 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 22 Apr 2020 23:31:56 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 3344C51D76AC73D432C4;
        Thu, 23 Apr 2020 11:31:54 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Thu, 23 Apr 2020 11:31:49 +0800
From:   Mao Wenan <maowenan@huawei.com>
To:     <ast@kernel.org>, <daniel@iogearbox.net>, <kafai@fb.com>,
        <songliubraving@fb.com>, <yhs@fb.com>, <andriin@fb.com>,
        <john.fastabend@gmail.com>, <kpsingh@chromium.org>
CC:     <netdev@vger.kernel.org>, <bpf@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, <dan.carpenter@oracle.com>,
        <andrii.nakryiko@gmail.com>
Subject: [PATCH bpf-next v2 2/2] libbpf: Return err if bpf_object__load failed
Date:   Thu, 23 Apr 2020 11:33:14 +0800
Message-ID: <20200423033314.49205-3-maowenan@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200423033314.49205-1-maowenan@huawei.com>
References: <20200422093329.GI2659@kadam>
 <20200423033314.49205-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

bpf_object__load() has various return code, when it failed to load
object, it must return err instead of -EINVAL.

Signed-off-by: Mao Wenan <maowenan@huawei.com>
Acked-by: Andrii Nakryiko <andriin@fb.com>
---
 tools/lib/bpf/libbpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 8f480e29a6b0..8e1dc6980fac 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -7006,7 +7006,7 @@ int bpf_prog_load_xattr(const struct bpf_prog_load_attr *attr,
 	err = bpf_object__load(obj);
 	if (err) {
 		bpf_object__close(obj);
-		return -EINVAL;
+		return err;
 	}
 
 	*pobj = obj;
-- 
2.20.1

