Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4694BE55D
	for <lists+kernel-janitors@lfdr.de>; Mon, 21 Feb 2022 19:00:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358981AbiBUNWj (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 21 Feb 2022 08:22:39 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358985AbiBUNWd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 21 Feb 2022 08:22:33 -0500
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4FDD2181C
        for <kernel-janitors@vger.kernel.org>; Mon, 21 Feb 2022 05:22:07 -0800 (PST)
Received: by mail-vk1-xa32.google.com with SMTP id l10so8617887vki.9
        for <kernel-janitors@vger.kernel.org>; Mon, 21 Feb 2022 05:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=94r73LrRNpO7YYFshzYM25uztFOXVTrm/QHuYFLiQ7w=;
        b=mADrFrQ+ZaM0TTq14DVXo+gL51+p2NcBjrN5ntCAKNfmsIAoFYM5Vg05TATz1Ho3Mp
         QntpqOZN3naiWGycPE6mYfwtwAPtneL7Rw/9nMeZB7wOOnN7+w2ZC1J+VfjucP6dvjgH
         lTknf1/DqWRCd1lnEY8XJSo0sGGNKAN/Q2AhiiVd+kM3VozUxI+7uzBPycoXp1Vaqj8M
         p4xbfkLFbWc6MBQeg7cIzVnUHjQm0cWUH2jqTe7+s4ph8qXwOHR43B1LSf5Ms39DYX6u
         tw+yyEkJLsVPXxfaTvunyjyvU9BKx7n8SvP6JAiSZnaM93bNVM1/BrqWWs2xeZURVai0
         iuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=94r73LrRNpO7YYFshzYM25uztFOXVTrm/QHuYFLiQ7w=;
        b=0NV6keuJyUF0ZvsOKB2J4zrIapN6tVJ6BM46BIrft9uZHHaIo8zXn3AqtDlmQZAluw
         GaPpFYG4jid8mujBhSMJJMEpcciYtmPeJMg/qEYXiHXifIhnMKAfjvkSfQP7krXZiQI6
         2rrw++gERG2YLTbRYlUkAsz3gS1+/WgiW7ISQ/fmTL3H6zSYvYw1Lvvej9GEkFgjA9rL
         jB44nbnY+PLob6+Zk/8kPtwvEaebwb/W7GLeDh6VRhy36RWZxu7ut9V8BAGTk3WgRsGK
         qG89xgsWlGHTY6IZJndrsAphuzcIWuBBulbZ9FDsimY3uJW7FyCTOjZW45uXw1jaNyHM
         6AJQ==
X-Gm-Message-State: AOAM530yMD5dcW45nxBRRSNXoogo3dXrFro/0d6DLndGQu0MO4tZzTWI
        aD0U0lPSsxTkPIroAsd6cQErrsMxFMO6XJlyOmA=
X-Google-Smtp-Source: ABdhPJzY3uRVFinJaUL83lROLKmjYUZ+TZRkDI5fVeFEVDRnDD4++VfHZ1wYicaoN9REPkmsXvaggGijHkcU6zzfCJU=
X-Received: by 2002:a05:6122:c9f:b0:330:e2ed:4786 with SMTP id
 ba31-20020a0561220c9f00b00330e2ed4786mr7735605vkb.29.1645449726641; Mon, 21
 Feb 2022 05:22:06 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a59:d8cd:0:b0:28c:6bb4:8918 with HTTP; Mon, 21 Feb 2022
 05:22:06 -0800 (PST)
From:   Anders Pedersen <ousmanebarkissou@gmail.com>
Date:   Mon, 21 Feb 2022 13:22:06 +0000
Message-ID: <CAE0fZ3d1A2trQ_6K_TKOtuh1imki0Bk2BNv+2OWiPjRVVrO41A@mail.gmail.com>
Subject: Hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Greeting, I'm Anders Pedersen, from Norway. I want to know if this
email is valid? Thanks.
