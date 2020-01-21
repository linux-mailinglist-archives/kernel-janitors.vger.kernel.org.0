Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE2514363B
	for <lists+kernel-janitors@lfdr.de>; Tue, 21 Jan 2020 05:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728750AbgAUEgo (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 20 Jan 2020 23:36:44 -0500
Received: from mail-il1-f172.google.com ([209.85.166.172]:46223 "EHLO
        mail-il1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727144AbgAUEgo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 20 Jan 2020 23:36:44 -0500
Received: by mail-il1-f172.google.com with SMTP id t17so1269549ilm.13
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Jan 2020 20:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucsb.edu; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=AhD32yA9dTE1GZMgOidZKC0TmsqG8ALfilUvQTKFq8g=;
        b=OCj7Pqt3X3Xj4bkAdhggt7stXTOiYmOrCIGCHHynn6AvjCH9POYxgB+rx7dLU/FFW3
         86SejlD/qeUFVNvCTrLqZ2vAfYGtmLcpW+OEH1JPepg9SAZUVPjP8DB/TGn+b2S1VDiQ
         GpeAxELGI+l9MuFpR7j8z8SLJudOjYWJCayTS7FI/b/VjyrQo//5CX34g1CEkg3atQNF
         HIDeCDmc+uig3C5SE+CfCXUcKfPdxa59bDmTBwLIiBBK1Qdgyge4WUwjf6QyTWoDqpug
         vHBO7qazx6Muec9eqjI10M/Tl0pQjCUwof+jEIr3jIYezLj3lJckQlno9yQnL41iGiz4
         c88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=AhD32yA9dTE1GZMgOidZKC0TmsqG8ALfilUvQTKFq8g=;
        b=SknPXKl6HxxMp3ck4TuMvcGC/kGRaniZejqHwMxPxcuUSgGdwbAU6icjNbR7PwMIst
         6rvT+spKBFVlfdDouQ+nmzLU78LREFT3NLI3JoYLXLnqEv/RXvUgwD/+WeEn35Iiy7TI
         1yukAMHFtdsUElDhku7Qim7XyzDYC3OmhvGTz61qZeKWzHUSgVWCtrRfn3tACBmmGiXd
         IjuOWjMT6tGfMUAKJzZ7Ybl/D1Zexs9mtEg0JEG57oGKTCrbZ0YbkdQaIT/L/9Eq9MYi
         K9b+X++2wXFIkb9yI0DZ1aSQ3AMGKUIRgQkP1iAv5MnhZ8VT6C3z5hJj48rqvfqgdIK6
         yEpw==
X-Gm-Message-State: APjAAAVh/ONxs9hyD7DSNl8l5ucQY09IVyJZk7Ztamm3mqYXDNDXilrP
        Hr3KysQaT1OFrRtzvP3yBMZMkCpyKhhWMz4kvKiFhx7G
X-Google-Smtp-Source: APXvYqw4sL1QIac9zemalzrpGKKpNkQkFfEUR7Ol6qbMCRw6Odp+COUgZl6lECqi1OUdFxG2aMDc7JG/u4zwHnOfSlg=
X-Received: by 2002:a92:1d95:: with SMTP id g21mr2162262ile.291.1579581403522;
 Mon, 20 Jan 2020 20:36:43 -0800 (PST)
MIME-Version: 1.0
From:   Raymond Deng <raymonddeng@ucsb.edu>
Date:   Mon, 20 Jan 2020 20:36:32 -0800
Message-ID: <CAHM57JTr=-YT_7Z1p9SbqtD0wYJDixK9Sjo8ffVfb0oe8zt8MA@mail.gmail.com>
Subject: Open tasks?
To:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi, are there open tasks for reasonably new people to do? Thanks.
